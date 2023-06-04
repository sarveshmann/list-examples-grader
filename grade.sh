CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

if [[ -f ./student-submission/ListExamples.java ]]
then 
    echo "Found ListExamples"

    cp ./student-submission/ListExamples.java ./grading-area
    cp ./TestListExamples.java ./grading-area
    cp -r ./lib ./grading-area 
    
    cd ./grading-area

    javac -cp $CPATH *java
    if [[ $? -eq 0 ]]
    then
        echo "Files compiled successfully."
        java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > result.txt
        cat result.txt
    else
        echo "Files didn't compile."
    
    
else 
    echo "ListExamples couldn't be found."
    exit 1
fi
