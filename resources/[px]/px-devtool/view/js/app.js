const copyToClipboard = str => {
    const el = document.createElement('textarea');
    el.value = str;
    document.body.appendChild(el);
    el.select();
    document.execCommand('copy');
    document.body.removeChild(el);
 };

window.addEventListener('message', (event) => {
	switch (event.data.action) {
		case 'copy':
			copyToClipboard(event.data.string);
		break;
	}
});