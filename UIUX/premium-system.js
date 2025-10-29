// premium-system.js - Premium vs Free account system

// Premium users list
const PREMIUM_USERS = ['userpremium', 'premium'];

// Check if current user is premium
function isPremiumUser() {
    const currentUser = localStorage.getItem('currentUser');
    return PREMIUM_USERS.includes(currentUser?.toLowerCase());
}

// Get account type
function getAccountType() {
    return isPremiumUser() ? 'Premium' : 'Free';
}

// Limits for free accounts
const FREE_LIMITS = {
    MAX_LISTS: 3,
    MAX_ITEMS_PER_LIST: 5
};

// Check if user can create new list
function canCreateList() {
    if (isPremiumUser()) return { allowed: true };
    
    const lists = getUserLists();
    if (lists.length >= FREE_LIMITS.MAX_LISTS) {
        return {
            allowed: false,
            message: `Free accounts are limited to ${FREE_LIMITS.MAX_LISTS} lists.\n\nUpgrade to Premium for unlimited lists! 💎`
        };
    }
    return { allowed: true };
}

// Check if user can add item to list
function canAddItem(listIndex) {
    if (isPremiumUser()) return { allowed: true };
    
    const lists = getUserLists();
    const list = lists[listIndex];
    if (!list) return { allowed: true };
    
    const itemCount = list.items?.length || 0;
    if (itemCount >= FREE_LIMITS.MAX_ITEMS_PER_LIST) {
        return {
            allowed: false,
            message: `Free accounts are limited to ${FREE_LIMITS.MAX_ITEMS_PER_LIST} items per list.\n\nUpgrade to Premium for unlimited items! 💎`
        };
    }
    return { allowed: true };
}

// Check if feature is available
function canUseFeature(feature) {
    if (isPremiumUser()) return { allowed: true };
    
    const restrictedFeatures = {
        'dark_mode': 'Dark mode is a Premium feature.\n\nUpgrade to unlock! 💎',
        'theme_color': 'Custom theme colors are Premium features.\n\nUpgrade to unlock! 💎',
        'export_data': 'Data export is a Premium feature.\n\nUpgrade to unlock! 💎'
    };
    
    if (restrictedFeatures[feature]) {
        return {
            allowed: false,
            message: restrictedFeatures[feature]
        };
    }
    return { allowed: true };
}

// Show premium badge in UI
function showPremiumBadge() {
    if (!isPremiumUser()) return '';
    return '<span style="background: linear-gradient(135deg, #FFD700 0%, #FFA500 100%); color: #000; padding: 4px 12px; border-radius: 12px; font-size: 0.75rem; font-weight: bold; margin-left: 8px;">💎 PREMIUM</span>';
}

// Show account limits in UI
function getAccountLimitsHTML() {
    if (isPremiumUser()) {
        return `
            <div style="background: linear-gradient(135deg, #FFD700 0%, #FFA500 100%); padding: 16px; border-radius: 12px; margin: 20px; color: #000;">
                <div style="font-size: 1.2rem; font-weight: bold; margin-bottom: 8px;">💎 Premium Account</div>
                <div style="font-size: 0.9rem;">
                    ✓ Unlimited lists<br>
                    ✓ Unlimited items<br>
                    ✓ No ads<br>
                    ✓ Dark mode<br>
                    ✓ Custom themes
                </div>
            </div>
        `;
    } else {
        const lists = getUserLists();
        const listsUsed = lists.length;
        const listsLeft = FREE_LIMITS.MAX_LISTS - listsUsed;
        
        return `
            <div style="background: #f8f9fa; padding: 16px; border-radius: 12px; margin: 20px; border: 2px solid #e0e0e0;">
                <div style="font-size: 1.1rem; font-weight: bold; margin-bottom: 12px; color: #666;">🆓 Free Account</div>
                <div style="font-size: 0.85rem; color: #666; margin-bottom: 12px;">
                    📋 Lists: ${listsUsed}/${FREE_LIMITS.MAX_LISTS} used<br>
                    📝 Items per list: Max ${FREE_LIMITS.MAX_ITEMS_PER_LIST}
                </div>
                <a href="#" onclick="showUpgradeModal(); return false;" style="display: block; background: linear-gradient(135deg, #FFD700 0%, #FFA500 100%); color: #000; padding: 12px; border-radius: 8px; text-align: center; text-decoration: none; font-weight: bold;">
                    💎 Upgrade to Premium
                </a>
            </div>
        `;
    }
}

// Show upgrade modal
function showUpgradeModal() {
    const modal = document.createElement('div');
    modal.id = 'upgrade-modal';
    modal.style.cssText = 'display: block; position: fixed; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0,0,0,0.7); z-index: 10000; backdrop-filter: blur(4px);';
    
    modal.innerHTML = `
        <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background: #fff; border-radius: 24px; padding: 32px; max-width: 400px; width: 90%; box-shadow: 0 20px 60px rgba(0,0,0,0.3);">
            <div style="text-align: center;">
                <div style="font-size: 4rem; margin-bottom: 16px;">💎</div>
                <h2 style="margin: 0 0 12px 0; font-size: 1.8rem; background: linear-gradient(135deg, #FFD700 0%, #FFA500 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Upgrade to Premium</h2>
                <p style="color: #666; margin-bottom: 24px;">Unlock all features and enjoy unlimited access!</p>
                
                <div style="text-align: left; background: #f8f9fa; padding: 20px; border-radius: 12px; margin-bottom: 24px;">
                    <div style="margin-bottom: 12px; display: flex; align-items: center; gap: 12px;">
                        <span style="font-size: 1.5rem;">✓</span>
                        <span>Unlimited lists & items</span>
                    </div>
                    <div style="margin-bottom: 12px; display: flex; align-items: center; gap: 12px;">
                        <span style="font-size: 1.5rem;">✓</span>
                        <span>No advertisements</span>
                    </div>
                    <div style="margin-bottom: 12px; display: flex; align-items: center; gap: 12px;">
                        <span style="font-size: 1.5rem;">✓</span>
                        <span>Dark mode & custom themes</span>
                    </div>
                    <div style="margin-bottom: 12px; display: flex; align-items: center; gap: 12px;">
                        <span style="font-size: 1.5rem;">✓</span>
                        <span>Export & backup data</span>
                    </div>
                    <div style="display: flex; align-items: center; gap: 12px;">
                        <span style="font-size: 1.5rem;">✓</span>
                        <span>Priority support</span>
                    </div>
                </div>
                
                <button onclick="closeUpgradeModal()" style="width: 100%; padding: 16px; background: #f5f5f5; border: none; color: #666; border-radius: 12px; font-size: 1rem; font-weight: 600; cursor: pointer;">
                    Maybe Later
                </button>
            </div>
        </div>
    `;
    
    document.body.appendChild(modal);
}

function closeUpgradeModal() {
    const modal = document.getElementById('upgrade-modal');
    if (modal) modal.remove();
}
