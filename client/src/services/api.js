import axios from 'axios';

const BASE_URL = process.env.QUIZ_MASTER_API_HOST;

// questions
function getQuestion(id) {
  return axios.get(`${BASE_URL}/questions/${id}`);
}

function getQuestions() {
  return axios.get(`${BASE_URL}/questions`);
}

function postQuestion(question) {
  return axios.post(`${BASE_URL}/questions`, question);
}

// answer checking
function checkAnswer(question, guess) {
  return axios.get(`${BASE_URL}/guess_checks/${question.id}?guess=${guess}`);
}

export default {
  getQuestion,
  getQuestions,
  postQuestion,
  checkAnswer,
};
