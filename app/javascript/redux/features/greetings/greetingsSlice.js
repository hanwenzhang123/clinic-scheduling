import { createSlice } from '@reduxjs/toolkit';
import { createAsyncThunk } from '@reduxjs/toolkit';

export const fetchRandomGreeting = createAsyncThunk('data/fetchRandomGreeting', async () => {
    try {
      const response = await fetch('http://localhost:3000/messages');
      if (!response.ok) {
        throw new Error('Error fetching data from the API');
      }
  
      const data = await response.json();
      return data.message;
    } catch (error) {
      throw new Error('Error fetching data from the API');
    }
  });

  const greetingsSlice = createSlice({
    name: 'greetings',
    initialState: '', 
    reducers: {},
    extraReducers: (builder) => {
      builder.addCase(fetchRandomGreeting.fulfilled, (state, action) => {
        return action.payload;
      });
    },
  });

export const { setGreetings } = greetingsSlice.actions;
export default greetingsSlice.reducer;
