'''
CSC373 Fall 2020
Assignment 6
University of Toronto Mississauga
'''

# Do NOT add any "import" statements
# Do NOT use Python dictionaries


# Constants
DIRS = 4
# For searching coordinates
X = 0
Y = 1
# DIR
UP = 0
RIGHT = 1
DOWN = 2
LEFT = 3
# TYPES of EDGE
TURN = 't'
MOVE = 'm'

# COST MATRIX REFERENCE
COST = 0  # Where cost of the path is held in cost matrix
START = 1  # Starting move type in cost matrix
FINAL = 2  # Final move type in cost matrix


def longest_travel_time(grid_size, a, b, c, M):
    '''
    Pre: integer grid_size, positive floats a, b, c, 2D-array M
    Post: return the longest travel time between any two configurations in the city
    '''
    n = grid_size*grid_size
    # Create cost matrix of 2d grid
    #    1 2
    #    3 4
    #    [1u, 1r, 1d, 1l, 2u,2r,2d, ..., 4u, 4r, 4d, 4l]
    cost = [[[float('inf'), -1, -1] for index in range(n*DIRS)] if M[ind_to_coord(node, grid_size)[X]][ind_to_coord(node, grid_size)[Y]] ==
            1 else None for node in range(n*DIRS)]
    # setup_cost_matrix
    for x in range(grid_size):
        for y in range(grid_size):
            if M[x][y] == 1:
                base= coord_to_ind(x, y, 0, grid_size)
                for direction in range(DIRS):
                    index= coord_to_ind(x, y, direction, grid_size)
                    cw= (direction + 1) % DIRS
                    ccw= (direction - 1) % DIRS
                    cost[index][base + cw]= [c, TURN, TURN]
                    cost[index][base + ccw]= [c, TURN, TURN]
                    if direction == UP and y != 0:
                        cost[index][coord_to_ind(
                            x, y-1, direction, grid_size)]= [a+b, MOVE, MOVE] if M[x][y-1] == 1 else float('inf')
                    elif direction == RIGHT and x != grid_size - 1:
                        cost[index][coord_to_ind(
                            x+1, y, direction, grid_size)]= [a+b, MOVE, MOVE] if M[x+1][y-1] == 1 else float('inf')
                    elif direction == DOWN and y != grid_size - 1:
                        cost[index][coord_to_ind(
                            x, y+1, direction, grid_size)]= [a+b, MOVE, MOVE] if M[x][y+1] == 1 else float('inf')
                    elif direction == LEFT and x != 0:
                        cost[index][coord_to_ind(
                            x-1, y, direction, grid_size)]= [a+b, MOVE, MOVE] if M[x-1][y] == 1 else float('inf')

    for outer_index in range(n*DIRS):
        outer= ind_to_coord(outer_index, grid_size)
        if M[outer[X]][outer[Y]] == 1:
            for center_index in range(n*DIRS):
                center= ind_to_coord(center_index, grid_size)
                if M[center[X]][center[Y]] == 1 and cost[outer_index][center_index] != [float('inf'), -1, -1]:
                    for inner_index in range(n*DIRS):
                        inner= ind_to_coord(inner_index, grid_size)
                        # Comparison only matters if tile is driveable
                        print()
                        if M[inner[X]][inner[Y]] == 1 and cost[center_index][inner_index] != [float('inf'), -1, -1]:
                            if cost[outer_index][center_index][FINAL] == MOVE and cost[outer_index][center_index][START] == MOVE:
                                if cost[outer_index][center_index][COST] + cost[center_index][inner_index][COST] - b < cost[outer_index][inner_index][COST]:
                                    cost[outer_index][inner_index][COST]= cost[outer_index][center_index][COST] + \
                                        cost[center_index][inner_index][COST] - b
                                    cost[outer_index][inner_index][START]= cost[outer_index][center_index][START]
                                    cost[outer_index][inner_index][FINAL]= cost[center_index][center_index][FINAL]
                            elif cost[outer_index][center_index][COST] + cost[center_index][inner_index][COST] < cost[outer_index][inner_index][COST]:
                                cost[outer_index][inner_index][COST]= cost[outer_index][center_index][COST] + \
                                    cost[center_index][inner_index][COST]
                                cost[outer_index][inner_index][START]= cost[outer_index][center_index][START]
                                cost[outer_index][inner_index][FINAL]= cost[center_index][center_index][FINAL]

    longest= 0
    # Find the longest saved
    for outer in range(n*DIRS):
        for inner in range(n*DIRS):
            coord= ind_to_coord(outer, grid_size)
            if cost[outer][inner] != [] and cost[outer][inner][COST] > longest and cost[outer][inner] != float('inf'):
                longest= cost[outer][inner]
    return longest


def ind_to_coord(index, grid_size):
    x= (index//(DIRS)) % grid_size
    y= (index//(DIRS))//grid_size
    dir= index % DIRS
    return (x, y, dir)


def coord_to_ind(x, y, dir, grid_size):
    '''
    Pre: Integer coordinates x and y representing the path and direction.
    '''
    ind= x*(DIRS)
    ind += y*(DIRS)*grid_size
    return ind + dir


if __name__ == '__main__':
    # some small test cases
    # Case 1
    time= longest_travel_time(3, 1.0, 1.0, 1.0, [[1, 1, 1], [1, 0, 1],
                                                  [1, 1, 1]])
    assert time == 11.0
