// theme-handler.js - Global theme handler for all pages

// Load all saved preferences on page load
document.addEventListener('DOMContentLoaded', function() {
    loadDarkMode();
    loadThemeColor();
    loadFontSize();
});

// Dark Mode
function loadDarkMode() {
    if (localStorage.getItem('darkMode') === 'true') {
        document.body.classList.add('dark-mode');
    }
}

// Theme Color
function loadThemeColor() {
    const savedColor = localStorage.getItem('themeColor');
    if (savedColor) {
        updateThemeColor(savedColor);
    }
}

function updateThemeColor(color) {
    document.documentElement.style.setProperty('--primary-color', color);
    
    // Update header gradient
    const headers = document.querySelectorAll('[style*="linear-gradient"]');
    headers.forEach(header => {
        if (header.style.background.includes('gradient')) {
            const darkerColor = adjustColor(color, -20);
            header.style.background = `linear-gradient(135deg, ${color} 0%, ${darkerColor} 100%)`;
        }
    });
    
    // Update FAB button
    const fab = document.querySelector('.fab');
    if (fab) fab.style.background = color;
    
    // Update NEW LIST button
    const newListBtn = document.getElementById('add-list-btn');
    if (newListBtn) newListBtn.style.background = color;
    
    // Update toggle switches
    let style = document.getElementById('theme-override');
    if (!style) {
        style = document.createElement('style');
        style.id = 'theme-override';
        document.head.appendChild(style);
    }
    style.textContent = `
        input:checked + .toggle-slider {
            background-color: ${color} !important;
        }
        .progress-bar {
            background: ${color} !important;
        }
        .nav-item.active {
            color: ${color} !important;
        }
    `;
}

function adjustColor(color, amount) {
    const num = parseInt(color.replace('#', ''), 16);
    const r = Math.max(0, Math.min(255, (num >> 16) + amount));
    const g = Math.max(0, Math.min(255, ((num >> 8) & 0x00FF) + amount));
    const b = Math.max(0, Math.min(255, (num & 0x0000FF) + amount));
    return '#' + ((r << 16) | (g << 8) | b).toString(16).padStart(6, '0');
}

// Font Size
function loadFontSize() {
    const savedFontSize = localStorage.getItem('fontSize');
    if (savedFontSize) {
        document.body.classList.add(`font-${savedFontSize}`);
    }
}
