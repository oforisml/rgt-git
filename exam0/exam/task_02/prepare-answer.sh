#!/bin/sh
if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters. Enter your name as single parameter."
    exit 1
fi
git -C ~/exam/task_01 log --graph --oneline --all > /tmp/git.log

cat ~/exam/task_01/some-animal.txt > /tmp/some-animal.txt
history > /tmp/history.txt
echo $1 > /tmp/name
[ ! -f /tmp/questions_answers.txt ] && echo "Its seems that you did not execute ~/exam/task_02/questions.sh" && echo "Please read the instructions again." && exit 1
cd /tmp
tar -czf "/home/myuser/exam/submit/submit_answer_by_$1.tar.gz" questions_answers.txt some-animal.txt git.log history.txt name
rm /tmp/*
cd - 1>/dev/null
echo Now upload your answer and let the instuctor know.
