#path = r"H:\Geodezie\ING\1_1\Geoinformatika\U4\U4\Uzly_Join2_Table.csv"
'''
pocet = 1
Coordinates = {}
Graph = {}
Graph2 = {}
Graph3 = {}
pocet = 0
with open(path) as csvfile:
    spamreader = csv.reader(csvfile, delimiter=' ', quotechar='|')
    for row in spamreader:
        radek = row
        radek1 = radek[0]
        radek2 = radek1.split(",")
        if pocet != 0:

            if int(radek2[7]) == int(radek2[5]):
                if int(radek2[5]) in Graph:
                    Graph[int(radek2[5])].append(int(radek2[8]))
                    Coordinates[int(radek2[5])] = [float(radek2[3]), float(radek2[4])]
                else:
                    Graph[int(radek2[5])] = [int(radek2[8])]
                    Coordinates[int(radek2[5])] = [float(radek2[3]), float(radek2[4])]
            elif int(radek2[8]) == int(radek2[5]):
                if int(radek2[5]) in Graph:
                    Graph[int(radek2[5])].append(int(radek2[7]))
                    Coordinates[int(radek2[5])] = [float(radek2[3]), float(radek2[4])]
                else:
                    Graph[int(radek2[5])] = [int(radek2[7])]
                    Coordinates[int(radek2[5])] = [float(radek2[3]), float(radek2[4])]

            if int(radek2[7]) == int(radek2[5]):
                if int(radek2[5]) in Graph2:
                    Graph2[int(radek2[5])][int(radek2[8])] = 1
                else:
                    Graph2[int(radek2[5])] = {int(radek2[8]): 1}
            elif int(radek2[8]) == int(radek2[5]):
                if int(radek2[5]) in Graph2:
                    Graph2[int(radek2[5])][int(radek2[7])] = 1
                else:
                    Graph2[int(radek2[5])] = {int(radek2[7]): 1}

            if int(radek2[7]) == int(radek2[5]):
                if int(radek2[5]) in Graph3:
                    Graph3[int(radek2[5])][int(radek2[8])] = 1
                else:
                    Graph3[int(radek2[5])] = {int(radek2[8]): 1}
            elif int(radek2[8]) == int(radek2[5]):
                if int(radek2[5]) in Graph3:
                    Graph3[int(radek2[5])][int(radek2[7])] = 1
                else:
                    Graph3[int(radek2[5])] = {int(radek2[7]): 1}
        pocet = pocet + 1
'''
#path = r"H:\Geodezie\ING\1_1\Geoinformatika\U4\U4\Hrany_Table.csv"
'''
pocet = 0
with open(path) as csvfile:
    spamreader = csv.reader(csvfile, delimiter=' ', quotechar='|')
    for row in spamreader:
        radek = row
        radek1 = radek[0]
        radek2 = radek1.split(",")
        if pocet != 0:



            cas = float(radek2[12])

            Graph2[int(radek2[6])][int(radek2[7])] = cas
            Graph2[int(radek2[7])][int(radek2[6])] = cas

        pocet = pocet + 1

'''
#path = r"H:\Geodezie\ING\1_1\Geoinformatika\U4\U4\Hrany_Table.csv"
'''
pocet = 0
with open(path) as csvfile:
    spamreader = csv.reader(csvfile, delimiter=' ', quotechar='|')
    for row in spamreader:
        radek = row
        radek1 = radek[0]
        radek2 = radek1.split(",")
        if pocet != 0:



            cas = float(radek2[5])

            Graph3[int(radek2[6])][int(radek2[7])] = cas
            Graph3[int(radek2[7])][int(radek2[6])] = cas

        pocet = pocet + 1

print(Coordinates)
print(Graph)
print(Graph2)
print(Graph3)

'''