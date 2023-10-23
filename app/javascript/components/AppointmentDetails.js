import React from "react";

const AppointmentDetails = ({ appointmentData }) => {
  console.log(appointmentData);
  return (
    <div>
      <h3>Appointment Details</h3>
      <table>
        <thead>
          <tr>
            <th>Appointment Date</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          {appointmentData.map((data, index) => {
            return (
              <tr key={index}>
                {console.log(data.appointment_date)}
                <td>{data.appointment_date}</td>
                <td>{data.start_time}</td>
                <td>{data.end_time}</td>
                <td>{data.status}</td>
              </tr>
            )
          })}
        </tbody>
      </table>
    </div>
  );
};

export default AppointmentDetails;
