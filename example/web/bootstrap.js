(async function () {
    const dev = window.ENV;

    if (dev === 'dev') {
        const script = document.createElement('script');
        script.src = 'main.dart.js';
        script.defer = true;

        document.body.appendChild(script);
        return;
    }

    let dart2wasm_runtime;
    let moduleInstance;
    try {
        const dartModulePromise = WebAssembly.compileStreaming(fetch('main.wasm'));
        const imports = {};
        dart2wasm_runtime = await import('./main.mjs');
        moduleInstance = await dart2wasm_runtime.instantiate(dartModulePromise, imports);
    } catch (exception) {
        console.error(`Failed to fetch and instantiate wasm module: ${exception}`);
        console.error('See https://dart.dev/web/wasm for more information.');
        console.warn('Running Dart code in JavaScript');
        import('./main.js').then(module => {
            console.log('---- JS ----');
        });
        return;
    }

    if (moduleInstance) {
        try {
            await dart2wasm_runtime.invoke(moduleInstance);
        } catch (exception) {
            console.error(`Exception while invoking test: ${exception}`);
        }
    }
})();
