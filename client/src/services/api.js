import axios from 'axios';

const BASE_URL = process.env.QUIZ_MASTER_API_HOST;

function getQuestions() {
  return axios.get(`${BASE_URL}/questions`);
}

export default {
  getQuestions,
};
