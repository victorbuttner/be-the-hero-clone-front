import axios from "axios";

const api = axios.create({
  baseURL: "https://be-the-hero-clone-backend.vercel.app/",
});

export default api;
