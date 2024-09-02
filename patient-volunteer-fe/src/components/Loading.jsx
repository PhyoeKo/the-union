import React from 'react';

const Loading = ({ isLoading, children, ...props }) => {
  return (
    <button
      {...props}
      disabled={isLoading}
      className={`relative inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-blue-500 hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 disabled:opacity-50 disabled:cursor-not-allowed ${isLoading ? 'cursor-wait' : ''}`}
    >
      {isLoading && (
        <svg
          className="absolute left-0 w-5 h-5 text-white animate-spin"
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
        >
          <circle
            className="opacity-25"
            cx="12"
            cy="12"
            r="10"
            stroke="currentColor"
            strokeWidth="4"
          ></circle>
          <path
            className="opacity-75"
            fill="currentColor"
            d="M4 12a8 8 0 0112.449-5.655A6.002 6.002 0 0120 12h-2a4 4 0 00-6.672-2.828A8 8 0 014 12z"
          ></path>
        </svg>
      )}
      {children}
    </button>
  );
};

export default Loading;
