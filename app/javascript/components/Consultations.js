import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchConsultations } from '../redux/features/consultationsSlice';
import AppointmentDetails from './AppointmentDetails';

function Consultations() {
  const dispatch = useDispatch();
  const consultations = useSelector((state) => state.consultations);

  useEffect(() => {
    dispatch(fetchConsultations());
  }, [dispatch]);

  return (
    <div>
      <h1>Consultations</h1>
      {consultations.length > 0 && <AppointmentDetails appointmentData={consultations} />}
    </div>
  );
}

export default Consultations;
