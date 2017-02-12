import axios from 'axios';

const BASE_URL = process.env.QUIZ_MASTER_API_HOST;

// questions
function getQuestion(id) {
  return axios.get(`${BASE_URL}/questions/${id}`);
}

function getQuestions() {
  return axios.get(`${BASE_URL}/questions`);
}

function createQuestion(question) {
  return axios.post(`${BASE_URL}/questions`, question);
}

function updateQuestion(question) {
  return axios.put(`${BASE_URL}/questions/${question.id}`, question);
}

function deleteQuestion(question) {
  return axios.delete(`${BASE_URL}/questions/${question.id}`);
}

// answer checking
function checkAnswer(question, guess) {
  return axios.get(`${BASE_URL}/guess_checks/${question.id}?guess=${guess}`);
}

// categories
function getCategories() {
  return axios.get(`${BASE_URL}/categories`);
}

export default {
  getQuestion,
  getQuestions,
  createQuestion,
  updateQuestion,
  checkAnswer,
  getCategories,
  deleteQuestion,
};
