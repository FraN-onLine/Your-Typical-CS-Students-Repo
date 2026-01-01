
#Weighted graph as a dictionary of dictionaries, based sa ucs activity, layout and format based on paperwork ko
graph = {
    'Laoag': {
        'Batac': 18,
        'Badoc': 37,
        'Paoay': 20
    },
    'Batac': {
        'Laoag': 18,
        'Paoay': 5,
        'Marcos': 7,
        'Dingras': 23
    },
    'Badoc': {
        'Laoag': 37,
        'Paoay': 22,
        'Currimao': 0
    },
    'Paoay': {
        'Laoag': 20,
        'Batac': 5,
        'Sarrat': 28
    },
    'Marcos': {
        'Batac': 7,
        'Vintar': 20
    },
    'Vintar': {
        'Marcos': 20,
        'Pagudpud': 71,
        'Dingras': 66
    },
    'Sarrat': {
        'Pagudpud': 79
    },
    'Pagudpud': {
        'Sarrat': 79,
        'Vintar': 71,
        'Solsona': 45
    },
    'Burgos': {
        'Bangui': 11
    },
    'Bangui': {
        'Burgos': 11,
        'Currimao': 90
    },
    'Currimao': {
        'Bangui': 90,
        'Badoc': 22
    },
    'Dingras': {
        'Vintar': 66,
        'Batac': 23,
        'Solsona': 9
    },
    'Solsona': {
        'Dingras': 9,
        'Pagudpud': 45
    }
}

#ucs func where it takes the weighted graph above and calc the path
def uceesssss(graph, start, goal):

    fringe = [] #queue of paths with costs
    explored = [] #closed list
    best_cost = {start: 0} #this tracks the best cost to reach a certain node
    step = 1

    #initial step print (based sa paper ku)
    print("Step 1")
    print("Node:", start)
    print("Fringe:")
    print(" (empty)")
    print("Expanded:")
    print(" (empty)")

    fringe.append([start, 0, [start]])
    step += 1

    while fringe:
        #priority rule
        fringe.sort(key=lambda x: x[1])
        node, cost, path = fringe.pop(0)

        if node in explored:
            continue
        
        explored.append(node)
        
        for neighbor in graph[node]:
            new_cost = cost + graph[node][neighbor]
            if neighbor not in best_cost or new_cost < best_cost[neighbor]:
                best_cost[neighbor] = new_cost
                fringe.append([neighbor, new_cost, path + [neighbor]])

        #Sort fringe after insertion
        fringe.sort(key=lambda x: x[1])


        print("\nStep", step)
        print("Expanded:", node)
        print("Fringe:")
        if fringe:
            for f in fringe:
                print(f" {f[0]} : {f[1]}")
        else:
            print(" (empty)")
        print("Expanded:", explored)
        step += 1

        #goal found, wow!
        if node == goal:
            print("\nGoal reached!")
            print("Final Path:", " -> ".join(path))
            print("Total Cost:", cost)
            return

#run the ucs 
uceesssss(graph, "Laoag", "Pagudpud")