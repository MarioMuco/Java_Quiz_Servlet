package klasat;

import java.util.ArrayList;
import java.util.List;

public class Quiz {
    private String quizTitle;
    private List<String> questionText;
    private List<String> answers;
    private List<String> correctAnswer;

    // Constructors, getters, and setters for the fields

    public String getQuizTitle() {
        return quizTitle;
    }

    public void setQuizTitle(String quizId) {
        this.quizTitle = quizId;
    }

    public List<String> getQuestionText() {
        return questionText;
    }

    public void setQuestionText(List<String> questionText) {
        this.questionText = questionText;
    }

    public List<String> getAnswers() {
        return answers;
    }

    public void setAnswers(List<String> answers) {
        this.answers = answers;
    }

    public List<String> getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(List<String> correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    // Method to add a question to the quiz
    public void addQuestion(String questionText, String optionA, String optionB, String optionC, String optionD, String correctOption) {
        if (this.questionText == null) {
            this.questionText = new ArrayList<>();
        }
        if (this.answers == null) {
            this.answers = new ArrayList<>();
        }
        if (this.correctAnswer == null) {
            this.correctAnswer = new ArrayList<>();
        }

        this.questionText.add(questionText);
        this.answers.add(optionA);
        this.answers.add(optionB);
        this.answers.add(optionC);
        this.answers.add(optionD);
        this.correctAnswer.add(correctOption);
    }
}
