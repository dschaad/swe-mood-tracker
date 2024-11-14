// Mood entry functionality
function addMoodEntry(mood) {
    const date = new Date();
    
    // Formats the date to this structure: "1/1/2024, 12:00 PM"
    const formattedDate = date.toLocaleString("en", {
        day: "numeric",
        month: "2-digit",
        year: "2-digit",
        hour: "numeric",
        minute: "2-digit"
    });
    const html =`<li>Mood: ${mood} - Date: ${formattedDate}</li>`;
    document.querySelector("#mood_log").insertAdjacentHTML("afterbegin", html);
}

function submitMood(event) {
    event.preventDefault();
    let mood = document.querySelector("#mood").value;
    addMoodEntry(mood);
}

document.querySelector("#mood_entry").addEventListener("submit", submitMood);