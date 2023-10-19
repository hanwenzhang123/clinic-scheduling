import { createSlice } from '@reduxjs/toolkit';
import { createAsyncThunk } from '@reduxjs/toolkit';

export const fetchConsultations = createAsyncThunk(
  "data/fetchConsultations",
  async () => {
    try {
      const response = await fetch(
        "http://localhost:3000/api/v1/consultations"
      );
      if (!response.ok) {
        throw new Error("Error fetching data from the API");
      }

      const data = await response.json();
      return data.message;
    } catch (error) {
      throw new Error("Error fetching data from the API");
    }
  }
);

const consultationsSlice = createSlice({
  name: "consultations",
  initialState: "",
  reducers: {},
  extraReducers: (builder) => {
    builder.addCase(fetchConsultations.fulfilled, (state, action) => {
      return action.payload;
    });
  },
});

export const { setConsultations } = consultationsSlice.actions;
export default consultationsSlice.reducer;
