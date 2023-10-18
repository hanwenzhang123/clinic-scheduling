import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchRandomGreeting } from '../redux/features/greetings/greetingsSlice';

function Greetings() {
  const dispatch = useDispatch();
  const greeting = useSelector((state) => state.greetings);

  useEffect(() => {
    dispatch(fetchRandomGreeting());
  }, [dispatch]);

  return (
    <div>
      <h1>Random Greeting</h1>
      <p>{greeting}</p>
    </div>
  );
}

export default Greetings;
