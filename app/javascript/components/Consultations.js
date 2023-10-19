import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchConsultations } from '../redux/features/consultationsSlice';

function Consultations() {
  const dispatch = useDispatch();
  const consultations = useSelector((state) => state.consultations);

  useEffect(() => {
    dispatch(fetchConsultations());
  }, [dispatch]);

  return (
    <div>
      <h1>Consultations</h1>
      <p>{consultations}</p>
    </div>
  );
}

export default Consultations;
