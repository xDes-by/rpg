if procdure_generator == nil then
	procdure_generator = class({})
end


local trees = {
    'models/items/faceless_void/faceless_void_arcana/debut/models/foliage/fv_arcana_tiny_tree.vmdl',
    'models/props_tree/dire_tree006.vmdl',
    'models/props_tree/palm_cloth_01.vmdl',
    'models/props_tree/armandpine/armandpine_02.vmdl',
}

obstraction_data = nil

function procdure_generator:generate_zone()
    -- Получаем все обстракшены
    
    
    -- Размеры зоны и шаг
    local min_coord, max_coord, step = -2500, 2500, 50
    local grid_size = (max_coord - min_coord) / step + 1
    local tree_density = 50  -- плотность деревьев

    -- Создаем пустую матрицу grid и заполняем её знаком "-"
    local grid = {}
    for i = 1, grid_size do
        grid[i] = {}
        for j = 1, grid_size do
            grid[i][j] = "-"
        end
    end
	
	-- generate_zone_path()
	
	
	obstraction_data = Entities:FindAllByClassname('dota_temp_tree')	

    -- Засаживаем деревья по периметру и заполняем матрицу
    create_points_tree_perimeter(grid, min_coord, max_coord, step, tree_density)
	create_points_tree_blows(grid, min_coord, max_coord, step, grid_size)

	-- Сажаем деревья
	for i = 1, #grid do
        local row = table.concat(grid[i], " ")
        print(row)
    end
    plant_trees(grid, min_coord, step)
	
	

end

local points = {
    Vector(1891, 1485, 0),
    Vector(-1734, 1741, 0),
    Vector(-1217, 205, 0),
    Vector(-945, -1700, 0),
    Vector(-1959, -507, 0),
    Vector(1374, -1471, 0),
    Vector(1438, 169, 0),
    Vector(536, 1864, 0),
}

local tree_distance = 50  -- Расстояние между деревьями
local num_curves = 6      -- Количество кривых линий

-- Функция для генерации случайных кривых между двумя точками
function generate_random_curve(start_point, end_point, num_segments)
    local curve_points = {}
    local current_point = start_point

    for i = 1, num_segments do
        -- Случайное смещение по X и Y для увеличения кривизны
	
        local offset_x = 0-- math.random(-100, 100)  -- Увеличенное смещение для большей кривизны
        local offset_y = 0--math.random(-100, 100)

        -- Интерполируем между текущей точкой и конечной
        local t = i / num_segments
        local x = (1 - t) * current_point.x + t * end_point.x
        local y = (1 - t) * current_point.y + t * end_point.y

        x = x + offset_x
        y = y + offset_y

        local new_point = Vector(x, y, 0)
        table.insert(curve_points, new_point)

        current_point = new_point  -- Обновляем текущую точку
    end
    
    return curve_points
end

-- Функция для высадки деревьев 
function plant_trees(grid, min_coord, step, obstraction_data)
    for i = 1, #grid do
        for j = 1, #grid[i] do
            if grid[i][j] == "+" then
                -- Вычисляем координаты для посадки дерева
                local x = min_coord + (i - 1) * step
                local y = min_coord + (j - 1) * step
                local point = Vector(x, y, 0)

                -- Проверяем, можно ли посадить дерево
                if find_clear_place_for_tree(point, obstraction_data) then
                    CreateTempTreeWithModel(point, 10, trees[4])
                end
            end
        end
    end
end


-- Функция для высадки деревьев вдоль кривой
function plant_trees_on_curve(curve_points, start_pos, end_pos)
    for _, point in ipairs(curve_points) do
		local dist_start = (point - start_pos):Length2D()
		local dist_end = (point - end_pos):Length2D()
		
        if dist_start > 250 and dist_end > 250 then
			CreateTempTreeWithModel(point, 3, trees[2])
		end	
    end
end


-- Основная функция
function generate_zone_path()
    local total_trees_planted = 0
    local point_pairs = {} 
    local used_second = {}

    -- Инициализация таблицы пар точек
    for i = 1, #points do
        point_pairs[i] = {first = '', second = ''}
    end

    -- Заполнение пар точек
    for k, v in ipairs(points) do
        point_pairs[k].first = v

        -- Создаём список доступных индексов, чтобы избежать совпадения и повторов
        local candidates = {}
        for i = 1, #points do
            if i ~= k and not used_second[i] then
                table.insert(candidates, i)
            end
        end

        -- Проверка, есть ли подходящие кандидаты
        if #candidates == 0 then
            print("No available points for pairing with point " .. k)
            return  -- Выход из функции, если нет доступных пар
        end

        -- Выбор случайного индекса из списка кандидатов
        local rand_index = candidates[math.random(#candidates)]
        point_pairs[k].second = points[rand_index]
        used_second[rand_index] = true  -- Помечаем индекс как использованный
    end

    -- Генерация и размещение деревьев на кривых между парами точек
    for i = 1, math.min(num_curves, #point_pairs) do
        local start_index = point_pairs[i].first
        local end_index = point_pairs[i].second
        local num_segments = math.ceil((start_index - end_index):Length2D() / tree_distance)
        local curve_points = generate_random_curve(start_index, end_index, num_segments)
        plant_trees_on_curve(curve_points, start_index, end_index)
        total_trees_planted = total_trees_planted + #curve_points
    end

    print("Total trees planted: " .. total_trees_planted)
end



--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- ГЕНЕРАЦИЯ ДЕРЕВЬЕВ ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

function create_points_tree_perimeter(grid, min_coord, max_coord, step, tree_density)
    local max_inward_offset = 500

    -- Верхняя и нижняя стороны
    for x = min_coord, max_coord, step + tree_density do
        for offset = 0, math.random(0, max_inward_offset), tree_density do
            local top_point = Vector(x, max_coord - offset, 0)
            local bottom_point = Vector(x, min_coord + offset, 0)

            mark_grid(grid, top_point, min_coord, step)
            mark_grid(grid, bottom_point, min_coord, step)
        end
    end

    -- Левая и правая стороны
    for y = min_coord, max_coord, step + tree_density do
        for offset = 0, math.random(0, max_inward_offset), tree_density do
            local left_point = Vector(min_coord + offset, y, 0)
            local right_point = Vector(max_coord - offset, y, 0)

			mark_grid(grid, left_point, min_coord, step)
			mark_grid(grid, right_point, min_coord, step)
        end
    end
end

--------------------------------------------------------------------------------------------------------------------------

count_trees = 0

function mark_grid(grid, point, min_coord, step)
    local x_idx = math.floor((point.x - min_coord) / step) + 1
    local y_idx = math.floor((point.y - min_coord) / step) + 1

    if grid[x_idx] and grid[x_idx][y_idx] then
        grid[x_idx][y_idx] = "+"  -- Помечаем клетку в матрице
		count_trees = count_trees +1
	end
end

function find_clear_place_for_tree(point)
    for _, v in pairs(obstraction_data) do
        local dist = (point - v:GetOrigin()):Length2D()
        if dist <= 150 then
            return false
        end
    end
    return true
end

function create_points_tree_blows(grid, min_coord, max_coord, step, grid_size)
	step = 50
    local blobs = {}
	
	function is_point_inside_polygon(px, py, polygon)
        local oddNodes = false
        local j = #polygon

        for i = 1, #polygon do
            local vi = polygon[i]
            local vj = polygon[j]
            if ((vi.y < py and vj.y >= py) or (vj.y < py and vi.y >= py)) then
                if (vi.x + (py - vi.y) / (vj.y - vi.y) * (vj.x - vi.x) < px) then
                    oddNodes = not oddNodes
                end
            end
            j = i
        end

        return oddNodes
    end

    local function generate_blob(cx, cy, baseRadius, jaggedness, points)
        local min_x, max_x = max_coord, min_coord
        local min_y, max_y = max_coord, min_coord

        local angleStep = (2 * math.pi) / points
        local blobPoints = {}

        for i = 0, points - 1 do
            local angle = i * angleStep

            local radius = baseRadius + math.random(-jaggedness, jaggedness)
            local x = cx + radius * math.cos(angle)
            local y = cy + radius * math.sin(angle)

            table.insert(blobPoints, {x = x, y = y})

            if x < min_x then min_x = x end
            if x > max_x then max_x = x end
            if y < min_y then min_y = y end
            if y > max_y then max_y = y end
        end

        for x = min_coord, max_coord, 150 do
            for y = min_coord, max_coord, 150 do
                if is_point_inside_polygon(x, y, blobPoints) then
                    local point = Vector(x, y, 0)
                    mark_grid(grid, point, min_coord, step)
                end
            end
        end

        table.insert(blobs, {min_x = min_x, min_y = min_y, max_x = max_x, max_y = max_y})
    end

    for i = 1, 30 do
        -- Выбираем случайные координаты в пределах области
        local cx = math.random(min_coord, max_coord)  -- Случайная координата x
        local cy = math.random(min_coord, max_coord)  -- Случайная координата y
        local baseRadius = math.random(400, 600)
        local jaggedness = math.random(98, 100)  -- Степень "неровности"
        local points = math.random(8, 15)        -- Количество вершин у кляксы
        generate_blob(cx, cy, baseRadius, jaggedness, points)
    end
end





