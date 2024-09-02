import React, { useState, useEffect, useContext } from 'react';
import Layout from '../components/Layout';
import axios from 'axios';
import config from '../config';
import { AuthContext } from '../AuthContext';
import AddVolunteerModal from './AddVolunteerModal';

const VolunteerPage = () => {
  const [volunteers, setVolunteers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [isModalOpen, setIsModalOpen] = useState(false);

  const handleOpenModal = () => {
    setIsModalOpen(true);
  };

  const handleCloseModal = () => {
    setIsModalOpen(false);
  };

  const handleVolunteerAdded = (newVolunteer) => {
    console.log("clicked volunteer add button")
    setVolunteers([...volunteers, newVolunteer]);
  };

  const { user } = useContext(AuthContext);

  useEffect(() => {
    const fetchVolunteers = async () => {
      try {
        const response = await axios.get(`${config.BASE_URL}/volunteers`, {
          headers: {
            'Authorization': `Bearer ${user.token}`,
            'Accept': 'application/json',
          }
        });
        setVolunteers(response.data.data);
      } catch (error) {
        setError('Error fetching volunteer');
      } finally {
        setLoading(false);
      }
    };

    fetchVolunteers();
  }, [user.token]);

  return (
    <Layout>
      <div className="p-4">
      <div className='flex justify-between items-center'>
      <h2 className="text-2xl font-bold mb-4">Volunteer List</h2>
      <button
          onClick={handleOpenModal}
          className="mb-4 px-4 py-2 bg-green-500 text-white rounded-md hover:bg-green-600"
        >
          Add Volunteer
      </button>
    </div>
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200">
            <thead className="bg-gray-50">
              <tr>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Code</th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Password</th>
              </tr>
            </thead>
            <tbody className="bg-white divide-y divide-gray-200">
              {volunteers.map((volunteer) => (
                <tr key={volunteer.id}>
                  <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{volunteer.id}</td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{volunteer.name}</td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{volunteer.code}</td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{volunteer.password}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        <AddVolunteerModal
          isOpen={isModalOpen}
          onClose={handleCloseModal}
          onVolunteerAdded={handleVolunteerAdded}
        />
      </div>
    </Layout>
  );
};

export default VolunteerPage;
