import React, { useContext } from 'react';
import { AuthContext } from '../AuthContext';
import { useNavigate } from 'react-router-dom';

const Layout = ({ children }) => {
  const { logout } = useContext(AuthContext);
  const navigate = useNavigate();

  const { user } = useContext(AuthContext);
  const handleLogout = () => {
    logout();
    navigate('/login');
  };

  return (
    <div className="flex h-screen">
      {/* Sidebar */}
      <aside className="w-64 bg-blue-900 text-white flex flex-col">
        <div className="p-6 text-2xl font-bold">Admin Panel</div>
        <nav className="flex-1">
          <ul>
            <li className="p-4 hover:bg-blue-700">
              <a href="/">Dashboard</a>
            </li>
            <li className="p-4 hover:bg-blue-700">
              <a href="/patients">Patients</a>
            </li>
            <li className="p-4 hover:bg-blue-700">
              <a href="/volunteers">Volunteers</a>
            </li>
          </ul>
        </nav>
      </aside>

      {/* Main Content */}
      <div className="flex-1 flex flex-col">
        {/* Topbar */}
        <header className="bg-white shadow p-4 flex justify-between items-center w-full fixed top-0 left-0 right-0 z-10">
          <h1 className="text-xl font-bold">PVM</h1>
          <div className='flex gap-3 justify-center items-center'>
              <h2>{user.name}</h2>
              <button
                onClick={handleLogout}
                className="bg-red-500 text-white px-4 py-2 rounded"
              >
                Logout
              </button>
          </div>
        </header>

        {/* Page Content */}
        <main className="flex-1 p-6 pt-20">
          {children}
        </main>
      </div>
    </div>
  );
};

export default Layout;
