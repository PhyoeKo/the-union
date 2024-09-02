import React, { useEffect, useState, useContext  } from 'react';
import Layout from '../components/Layout';
import axios from 'axios';
import { AuthContext } from '../AuthContext';
import config from '../config'

const Dashboard = () => {
  const [patientsCount, setPatientsCount] = useState(0);
  const [volunteersCount, setVolunteersCount] = useState(0);
  const { user } = useContext(AuthContext);
  useEffect(() => {
    // Fetch the counts from your API
    const fetchCounts = async () => {
        try {
            const option = {
              headers: {
                'Authorization': `Bearer ${user.token}`,
                'Accept': 'application/json',
              },
            };
    
            const patientsResponse = await axios.get(`${config.BASE_URL}/patients`, option);
            const volunteersResponse = await axios.get(`${config.BASE_URL}/volunteers`, option);
    
            setPatientsCount(patientsResponse.data.data.length);
            setVolunteersCount(volunteersResponse.data.data.length);
          } catch (error) {
            console.error('Failed to fetch counts:', error);
          }
    };

    fetchCounts();
  }, []);

  return (
    <Layout>
    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
    <div className="bg-white shadow rounded-lg p-6 flex flex-col justify-center items-center">
      <h2 className="text-2xl font-bold">Patients</h2>
      <p className="text-3xl mt-4">{patientsCount}</p>
    </div>
    <div className="bg-white shadow rounded-lg p-6 flex flex-col justify-center items-center">
      <h2 className="text-2xl font-bold">Volunteers</h2>
      <p className="text-3xl mt-4">{volunteersCount}</p>
    </div>
  </div>
    </Layout>
  );
};

export default Dashboard;
