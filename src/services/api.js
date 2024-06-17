import axios from "axios";

const api = axios.create({
  baseURL: "https://be-the-hero-clone-backend-production.up.railway.app/",
});

export default api;
