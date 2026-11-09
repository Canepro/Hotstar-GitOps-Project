import axios from "axios";

const tmdbApiKey = process.env.REACT_APP_TMDB_API_KEY?.trim();
export const hasTmdbApiKey = Boolean(tmdbApiKey);

const tmdbAxiosInstance = axios.create({
    baseURL: "https://api.themoviedb.org/3",
    params: tmdbApiKey ? { api_key: tmdbApiKey } : {},
});

export default tmdbAxiosInstance;
