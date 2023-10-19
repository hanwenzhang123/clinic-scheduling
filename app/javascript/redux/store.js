import { configureStore } from '@reduxjs/toolkit';
import consultationReducer from "./features/consultationSlice";
import greetingsReducer from "./features/greetingsSlice";

const store = configureStore({
  reducer: {
    consultations: consultationReducer,
    greetings: greetingsReducer,
  },
});

export default store;
