import fs from 'fs';

try {
  if (!fs.existsSync('public')) {
    fs.mkdirSync('public');
  }

  const files = ['index.html', 'install.ps1', 'install.sh', 'aetherai.cjs'];
  
  for (const file of files) {
    if (fs.existsSync(file)) {
      fs.copyFileSync(file, `public/${file}`);
      console.log(`Copied ${file} to public/`);
    } else {
      console.warn(`Warning: ${file} not found.`);
    }
  }

  console.log('Build completed successfully.');
} catch (error) {
  console.error('Build failed:', error);
  process.exit(1);
}
