import React, { useState, useContext,useEffect } from 'react';
import axios from 'axios';
import config from '../config';
import { AuthContext } from '../AuthContext';

const AddPatientModal = ({ isOpen, onClose, onPatientAdded }) => {
  const [formData, setFormData] = useState({
    name: '',
    volunteer_id:''
  });
  const [volunteers, setVolunteers] = useState([]);
  const [errors, setErrors] = useState({});
  const [isSubmitting, setIsSubmitting] = useState(false);
  const { user } = useContext(AuthContext);

  useEffect(() => {
    // Fetch volunteers when the modal opens
    if (isOpen) {
      const fetchVolunteers = async () => {
        try {
          const response = await axios.get(`${config.BASE_URL}/volunteers`, {
            headers: {
              'Authorization': `Bearer ${user.token}`,
              'Accept': 'application/json',
            },
          });
          setVolunteers(response.data.data);
        } catch (error) {
          console.error('Error fetching volunteers:', error);
        }
      };

      fetchVolunteers();
    }
  }, [isOpen]);

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const validate = () => {
    const newErrors = {};
    if (!formData.name) newErrors.name = "Name is required";
    if (!formData.volunteer_id) newErrors.volunteer_id = "Volunteer is required";
    return newErrors;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const validationErrors = validate();
    if (Object.keys(validationErrors).length > 0) {
      setErrors(validationErrors);
      return;
    }
    setIsSubmitting(true);
    try {
      const response = await axios.post(`${config.BASE_URL}/patients`, formData, {
        headers: {
          'Authorization': `Bearer ${user.token}`,
          'Accept': 'application/json',
        },
      });
      onPatientAdded(response.data.data);
      onClose();
    } catch (error) {
      console.error('Error adding patient:', error);
    } finally {
      setIsSubmitting(false);
    }
  };

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 bg-gray-600 bg-opacity-50 flex justify-center items-center">
      <div className="bg-white p-6 rounded-lg shadow-lg w-full max-w-md">
        <h2 className="text-2xl font-bold mb-4">Add Patient</h2>
        <form onSubmit={handleSubmit}>
          <div className="mb-4">
            <label className="block text-gray-700">Name</label>
            <input
              type="text"
              name="name"
              value={formData.name}
              onChange={handleChange}
              // required
              className={`w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 ${errors.name ? 'border-red-500 focus:ring-red-500' : 'focus:ring-blue-500'}`}
            />
            {errors.name && <p className="text-red-500 text-sm mt-1">{errors.name}</p>}
          </div>
          <div className="mb-4">
            <label className="block text-gray-700">Volunteer</label>
            <select
              name="volunteer_id"
              value={formData.volunteer_id}
              onChange={handleChange}
              // required
              className={`w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 ${errors.volunteer_id ? 'border-red-500 focus:ring-red-500' : 'focus:ring-blue-500'}`}
            >
              <option value="">Select a volunteer</option>
              {volunteers.map((volunteer) => (
                <option key={volunteer.id} value={volunteer.id}>
                  {volunteer.name}
                </option>
              ))}
            </select>
            {errors.volunteer_id && <p className="text-red-500 text-sm mt-1">{errors.volunteer_id}</p>}
          </div>
          <div className="flex justify-end">
            <button
              type="button"
              onClick={onClose}
              className="mr-4 px-4 py-2 bg-gray-500 text-white rounded-md hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-gray-500"
            >
              Cancel
            </button>
            <button
              type="submit"
              disabled={isSubmitting}
              className="px-4 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              {isSubmitting ? 'Adding...' : 'Add Patient'}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default AddPatientModal;
