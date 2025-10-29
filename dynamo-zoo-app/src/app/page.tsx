"use client";
import Image from 'next/image'
import { useEffect, useState } from 'react'

export default function Home() {

  const baseUrl = "https://api.fboeck-trc.de"

  const [animalName, setAnimalName] = useState("");
  const [animalImageUrl, setAnimalImageUrl] = useState("");

  async function getAnimalImage() {
    if (animalName) {
      const response = await fetch(`${baseUrl}/animals?name=${animalName}`);
      const { s3_object_url } = await response.json();
      setAnimalImageUrl(s3_object_url);
    }
  }

  function getSelectedAnimal(selection: string): void {
    setAnimalName(selection);
  }

  return (
    <main className="flex min-h-screen flex-col items-center justify-center">
      <div className="align-middle relative flex place-items-center before:absolute before:h-[300px] before:w-[480px] before:-translate-x-1/2 before:rounded-full before:bg-gradient-radial before:from-white before:to-transparent before:blur-2xl before:content-[''] after:absolute after:-z-20 after:h-[180px] after:w-[240px] after:translate-x-1/3 after:bg-gradient-conic after:from-sky-200 after:via-gray-200 after:blur-2xl after:content-[''] before:dark:bg-gradient-to-br before:dark:from-transparent before:dark:to-gray-700 before:dark:opacity-10 after:dark:from-sky-900 after:dark:via-[#0141ff] after:dark:opacity-40 before:lg:h-[360px] z-[-1]">
        <Image
          className="relative dark:drop-shadow-[0_0_0.3rem_#ffffff70] dark:invert"
          src="/next.svg"
          alt="Next.js Logo"
          width={180}
          height={37}
          priority
        />
      </div>
      <p className="flex mt-5 mb-2">
        Welcome to my first website created with terraform!
      </p>
      <p className="flex m-2">
        It is fully hosted on AWS and serves a RESTful API to retrieve images of animals.
      </p>
      <p className="flex m-2">
        For now you can only select dogs, cats and birds. Maybe I&apos;ll add more in the future (probably not :&apos;) )  
      </p>
      <label htmlFor="animals" className="block m-2 text-sm font-medium text-gray-900 dark:text-white">Select an option</label>
      <select onChange={(e) => getSelectedAnimal(e.target.value)} id="animals" className="m-2 w-1/6 bg-gray-500 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-gray-500 focus:border-gray-500 block p-2.5 dark:bg-gray-500 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-gray-500 dark:focus:border-gray-600">
        <option value="">Choose an animal</option>
        <option value="dogs">Dogs</option>
        <option value="cats">Cats</option>
        <option value="birds">Birds</option>
      </select>
      <button onClick={() => getAnimalImage()} className="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded m-2">
        Retrieve image
      </button>
        <Image
            className="dark:drop-shadow-[0_0_0.3rem_#ffffff70] m-2"
            src={animalImageUrl || 'data:'}
            alt="Animal image"
            width={180}
            height={225}
            style={{width: '280px', height: '350px', objectFit: 'contain', visibility: animalImageUrl ? 'visible' : 'hidden'}}	
            unoptimized
          />
    </main>
  )
}
