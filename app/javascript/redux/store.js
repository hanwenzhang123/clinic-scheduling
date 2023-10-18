import { configureStore } from '@reduxjs/toolkit';
import greetingsReducer from './features/greetings/greetingsSlice';

const store = configureStore({
  reducer: {
    greetings: greetingsReducer,
  },
});

export default store;
