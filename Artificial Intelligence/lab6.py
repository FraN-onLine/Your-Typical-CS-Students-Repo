
#graph as represented by itself and nodes its connected to alphabetically
graph = {
    'A': ['M', 'N'],
    'M': ['P', 'Q'],
    'N': ['Q', 'R'],
    'P': ['X'],
    'Q': ['R'],
    'R': ['X'],
    'X': []
}

def bfs(graph, start, goal):
    queue = [[start]]  # queue of all paths (so first iteration is A, then A->M, A-N, )
    closed_list = []   # CL (closed list or visited nodes)

    print(f"{'Step':<5}{'Expanded':<12}{'Fringe (L)':<45}{'Closed List (CL)'}")
    step = 1

    while queue:
        path = queue.pop(0) #get first node, BFS is FIFO kaya yan (After first iteration diba A->M, then A->M ulit then A->M->P, A->M->Q and so on)
        node = path[-1] #get last node in path

        if node not in closed_list:
            closed_list.append(node)

        #append all children of the node to the queue
        for neighbor in graph[node]:
            new_path = path + [neighbor]
            queue.append(new_path)

        #prints each step
        fringe = [p[-1] for p in queue] #get last nodes in all paths in queue
        print(f"{step:<5}{node:<12}{str(fringe):<45}{closed_list}")
        step += 1

        #if goal is founds return the path to the goal
        if node == goal:
            print("\nGoal found")
            return path

    return None


#bale bfs
start_node = 'A' #A is the start
goal_node = 'X' #X is the end goal (u can play aroundw ith this or whatever)
solution = bfs(graph, start_node, goal_node)

if solution:
    print("\nSolution (BFS):", " -> ".join(solution))
else:
    print("\nNo path to goal node found.")
