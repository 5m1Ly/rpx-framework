

window.addEventListener('message', ev => {
	const data = ev.data
	switch (data.action) {
		case 'setup':
			// ready item slots 
		break;
		case 'open':
			const el = document.querySelector('.main-container')
			el.style.display = 'block';
			// open
		break;
	}
})