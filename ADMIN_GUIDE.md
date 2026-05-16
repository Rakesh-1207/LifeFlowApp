# LifeFlow Admin Dashboard

## Overview
The admin dashboard is a comprehensive user management system built with the same elegant design language as the main LifeFlow application. It provides admins with complete control over user data with the ability to view, edit, and delete user accounts.

## Features

### 1. **User Management Dashboard**
   - View all registered users with detailed information
   - Real-time statistics (Total Users, Active Donors, Active Recipients, Admins)
   - Advanced filtering by:
     - Blood Type
     - User Role (Donor, Recipient, Admin)
     - Search by name, email, or phone

### 2. **User Operations**
   - **View Users**: Displays all users in a comprehensive table with:
     - Name, Email, Phone
     - Blood Type (color-coded badge)
     - User Role (Donor, Recipient, Admin)
     - Location
     - Account Status (Active/Inactive)
     - Join Date
   
   - **Edit Users**: Modify user information including:
     - Name, Email, Phone
     - Blood Type
     - Location
     - Role Assignment
     - Account Status
   
   - **Delete Users**: Permanently remove user accounts with confirmation dialog

### 3. **Statistics Dashboard**
   - Total Users Count
   - Active Donors Count
   - Active Recipients Count
   - Lives Saved Count
   - Blood Type Distribution (all 8 types)
   - User Role Distribution (Donor/Recipient/Admin breakdown)

### 4. **Interface Features**
   - Responsive design that works on desktop, tablet, and mobile
   - Dark mode toggle
   - Real-time data refresh (auto-updates every 30 seconds)
   - Smooth animations and transitions
   - Glass morphism UI design matching the main app
   - Modal dialogs for edit and delete operations

## How to Access

### For Admin Users:
1. Log in to the main LifeFlow application with an admin account
2. A new **"Admin"** menu item will appear in the navigation bar
3. Click on the Admin link to access the admin dashboard
4. You will be directed to `admin.html`

### Direct Access:
- Navigate to: `http://localhost:3000/admin.html` (replace with your server URL)
- Note: You must be logged in with an admin account to access the dashboard

## Usage Guide

### Viewing Users
1. Go to the "Users" tab (default view)
2. Users are displayed in a table with all their details
3. Use the search box to find users by name, email, or phone
4. Use the dropdown filters to filter by blood type or role

### Editing a User
1. Click the **Edit** button (pencil icon) next to the user
2. A modal will appear with all editable fields
3. Modify the desired information
4. Click **Save Changes**
5. The user list will automatically refresh

### Deleting a User
1. Click the **Delete** button (trash icon) next to the user
2. A confirmation dialog will appear showing the user's name
3. Click **Delete** to confirm permanent removal
4. Click **Cancel** to keep the user

### Viewing Statistics
1. Click the **Statistics** tab in the navigation
2. View all summary statistics
3. See blood type distribution
4. See role distribution among users

### Theme Toggle
1. Click the **Theme** button (moon icon) in the navigation
2. The interface will switch between light and dark modes
3. Your preference is saved in local storage

## Technical Details

### Backend Routes Used
- `GET /api/users/` - Get all users (requires admin auth)
- `PUT /api/users/:id` - Update user (requires admin auth)
- `DELETE /api/users/:id` - Delete user (requires admin auth)
- `GET /api/globalStats/` - Get system statistics

### Security
- All admin operations require:
  - Valid JWT authentication token
  - Admin role verification via `adminAuth` middleware
  - Server-side validation of all operations

### Frontend Stack
- Pure Vanilla JavaScript (no frameworks)
- HTML5 & CSS3
- Font Awesome Icons
- Responsive Grid Layout
- CSS Variables for theming

### File Structure
```
frontend/
├── admin.html          # Admin dashboard HTML
├── admin.js            # Admin functionality & API calls
├── index.html          # Main app (modified to add admin link)
├── script.js           # Main app logic (modified to show admin link)
└── style.css           # Styles (added admin dashboard styles)

backend/
├── routes/
│   └── users.js        # User management endpoints
├── middleware/
│   └── auth.js         # Authentication & admin verification
└── models/
    └── User.js         # User schema with admin role
```

## API Endpoints

### Get All Users (Admin Only)
```
GET /api/users/
Headers: Authorization: Bearer <token>
Response: { users: [...] }
```

### Update User (Admin Only)
```
PUT /api/users/:id
Headers: Authorization: Bearer <token>
Body: {
  name: string,
  email: string,
  phone: string,
  bloodType: string,
  location: string,
  role: 'donor' | 'recipient' | 'admin',
  isActive: boolean
}
```

### Delete User (Admin Only)
```
DELETE /api/users/:id
Headers: Authorization: Bearer <token>
Response: { message: 'User deleted successfully' }
```

## Error Handling
- 401 Unauthorized: Invalid or missing token
- 403 Forbidden: Non-admin user attempting admin operations
- 404 Not Found: User not found
- 500 Server Error: Database or server error

## Features & Customization

### Styling
The admin dashboard uses CSS variables defined in the root of style.css:
- `--primary`: Red accent color (#FF4D4D)
- `--secondary`: Dark blue text (#31485f)
- `--bg-gradient`: Background gradient
- All colors support dark mode

### Dark Mode
Dark mode styles are automatically applied when the user enables it. Stored in localStorage as `nightMode`.

### Auto-Refresh
The user list automatically refreshes every 30 seconds to show latest data.

## Troubleshooting

### Admin Link Not Showing
- Ensure you're logged in with an admin account
- Check that `user.role === 'admin'` in the stored user data
- Clear browser cache and refresh

### Can't Access Admin Dashboard
- Verify you have admin privileges
- Check that your JWT token is valid
- Ensure you're accessing from the correct port (default: 5000 for backend)

### Users Not Loading
- Check browser console for error messages
- Verify backend is running and accessible
- Check that database connection is active
- Verify authentication token is valid

### Edit/Delete Not Working
- Ensure backend server is running
- Check network tab in browser DevTools for failed requests
- Verify user has admin permissions on backend
- Check server logs for errors

## Best Practices

1. **Regular Backups**: Keep regular database backups before bulk operations
2. **Logging**: All admin actions should be logged (implement admin action logs)
3. **Permissions**: Only trusted users should have admin access
4. **Verification**: Always verify user information before deletion
5. **Updates**: Keep the system updated with latest security patches

## Future Enhancements

Potential improvements for the admin dashboard:
- Admin action logging and audit trail
- Bulk operations (bulk delete, bulk edit)
- Export user data to CSV/Excel
- Advanced reporting and analytics
- User communication tools
- System health monitoring
- Database backups
- Role-based access control improvements

## Support

For issues or questions about the admin dashboard:
1. Check the troubleshooting section above
2. Review server logs for error messages
3. Check browser console for client-side errors
4. Verify database connectivity

---

**Last Updated**: May 13, 2026
**Version**: 1.0
