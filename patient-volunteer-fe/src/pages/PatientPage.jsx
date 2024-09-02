import React, { useState, useEffect, useContext } from 'react';
import Layout from '../components/Layout';
import axios from 'axios';
import Loading from '../components/Loading';
import config from '../config';
import { AuthContext } from '../AuthContext';
import AddPatientModal from './AddPatientModal';

const PatientsPage = () => {
  const [patients, setPatients] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const { user } = useContext(AuthContext);
  const [isModalOpen, setIsModalOpen] = useState(false);

  const handleOpenModal = () => {
    setIsModalOpen(true);
  };

  const handleCloseModal = () => {
    setIsModalOpen(false);
  };

  const handlePatientAdded = (newPatient) => {
    setPatients([...patients, newPatient]);
  };

  useEffect(() => {
    const fetchPatients = async () => {
      try {
        const response = await axios.get(`${config.BASE_URL}/patients`, {
          headers: {
            'Authorization': `Bearer ${user.token}`,
            'Accept': 'application/json',
          }
        });
        setPatients(response.data.data);
      } catch (error) {
        setError('Error fetching patients');
      } finally {
        setLoading(false);
      }
    };

    fetchPatients();
  }, [user.token]);

  return (
    <Layout>
      <div className="p-4">
        <div className='flex justify-between items-center'>
          <h2 className="text-2xl font-bold mb-4">Patient List</h2>
          <button
              onClick={handleOpenModal}
              className="mb-4 px-4 py-2 bg-green-500 text-white rounded-md hover:bg-green-600"
            >
              Add Patient
          </button>
        </div>
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200">
            <thead className="bg-gray-50">
              <tr>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Code</th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Volunteer</th>
              </tr>
            </thead>
            <tbody className="bg-white divide-y divide-gray-200">
            {patients.map((patient) => (
              <tr key={patient.id}>
                <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{patient.id}</td>
                <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{patient.name}</td>
                <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{patient.code}</td>
                <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{patient.volunteer}</td>
              </tr>
            ))}
            </tbody>
          </table>
        </div>
        <AddPatientModal
          isOpen={isModalOpen}
          onClose={handleCloseModal}
          onPatientAdded={handlePatientAdded}
        />
      </div>
    </Layout>
  );
};

export default PatientsPage;
