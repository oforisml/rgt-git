import json,  ast

# room_id, date, name, message
# 
def persist_data(data):
    with open("db.txt", "a+") as file:
        file.write(json.dumps(data))
        file.write(",\n")


def save(room, message_date, username, message):
    #Creating a dictionary/Json formated file

    # Setting the main data sets
    data={"room": room, "username": username, "message_date": message_date, "message": message}

    
    #returns the data
    persist_data(data)
    return data

def gettRoom_data(room):
    data_set = ""
    data = [json.loads(line) for line in open('db.txt', 'r+', encoding='utf-8')]
    for i in data:
        print(i)
        print("NEXT: \n")
    # return data