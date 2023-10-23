import { configureStore } from '@reduxjs/toolkit';
import consultationsReducer from "./features/consultationsSlice";
import greetingsReducer from "./features/greetingsSlice";

const store = configureStore({
  reducer: {
    consultations: consultationsReducer,
    greetings: greetingsReducer,
  },
});

export default store;
