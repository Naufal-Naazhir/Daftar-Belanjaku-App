// user-data-helper.js - Helper untuk data per user

// Get user-specific localStorage key
function getUserListsKey() {
    const currentUser = localStorage.getItem('currentUser');
    if (!currentUser) {
        console.error('No user logged in');
        return 'allLists'; // fallback
    }
    return `allLists_${currentUser}`;
}

// Get lists for current user
function getUserLists() {
    const listsKey = getUserListsKey();
    return JSON.parse(localStorage.getItem(listsKey) || '[]');
}

// Save lists for current user
function saveUserLists(lists) {
    const listsKey = getUserListsKey();
    localStorage.setItem(listsKey, JSON.stringify(lists));
}

// Clear all data for current user (untuk Clear All Data di settings)
function clearUserData() {
    const listsKey = getUserListsKey();
    localStorage.removeItem(listsKey);
}
