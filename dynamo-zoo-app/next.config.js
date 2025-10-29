/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  images: {
      remotePatterns: [
        {
          protocol: 'https',
          hostname: 'fb-dynamozoo-image-bucket.s3.eu-central-1.amazonaws.com',
          port: '',
          pathname: '/**',
        },
        // {
        //   protocol: 'https',
        //   hostname: 'fboeck-trc.de',
        //   port: '',
        //   pathname: '/**',
        // },
      ],
    },
}

module.exports = nextConfig
