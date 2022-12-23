#!/bin/bash

score=0

echo "write your answers in lowercase only!"
# LOOP INSIDE Questions array:
questions_array=(
    "What is the Container Hostname?"
    "What is the container IP?"
    "What is the primary process?" 
    "Who is 1000 user?" 
)
  
Counter=0
for question in "${questions_array[@]}";do
    echo "$question"
    read student_answer

    echo "What command did you use?"
    read student_command
    if [ "$Counter" -eq 0 ];then

        echo $(( $Counter + 1 ))")  Q: "$question > ~/exam/submit/answers.txt
        echo "    A:"$student_answer >> ~/exam/submit/answers.txt
    else
        echo $(( $Counter + 1 ))")  Q: "$question >> ~/exam/submit/answers.txt
        echo "    A: "$student_answer >> ~/exam/submit/answers.txt
    fi
    echo "    C: "$student_command >> ~/exam/submit/answers.txt

    let Counter++

    echo ""
    echo "" >> ~/exam/submit/answers.txt
done


# LOOP INSIDE OPEN QUESTION ARRAY
open_question_array=(
    "How can I copy a file from a container to a host (without Volume) ?" 
    "What is the command that shows you the container environment variables (inside the container) ?"
    "What animal did you saw in task 01?"
)

Open_Counter=0
for question in "${open_question_array[@]}";do
    echo "$question"
    read student_answer
    echo ""

    echo $(( $Counter + 1 ))")  Q: "$question >> ~/exam/submit/answers.txt
    echo "    A: "$student_answer >> ~/exam/submit/answers.txt
    let Counter++
    let Open_Counter++
    echo "" >> ~/exam/submit/answers.txt

    
done
cp ~/exam/submit/answers.txt /tmp/questions_answers.txt
echo -e "\033[1;32mDone, you can continue to the next assigment.\033[0m"
