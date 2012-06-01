# Static site for the podcast Eric and Mitch Explain.

### Developing

This site is built with [Middleman]('https://github.com/middleman/middleman') so checkout that website for the gist on how to work on the site.

**Getting Setup**

First clone the github repository

    git clone git://github.com/mitchlloyd/eric-and-mitch-explain.git

Then run bundle

    bundle

If everything worked out you can then run

    bundle exec middleman

And you should be able to see the website at http://localhost:4567

### Deploying

First run `rake build` and then run `rake deploy`.

### Workflow for Releasing a Podcast (In-Progress)

Right now there are a lot of steps to release a podcast. The goal of this application will be to reduce the number of steps and make this as easy and fast as possible.

1. Mix down the recorded podcast in mp3 format. The recommended format is a 64 Kbps, mono file. Save the audio in the mixdowns directory and make sure it has the episode number in the file name (eg. '009-whatever.mp3').

2. Create a file in the source/episodes directory with the number in the title ('009-anything.markdown'). The entry should look like this:

    ---
    title: Sweet Podcast Title
    data: 2012-06-01
    ---

    Here is a desciption of the episode (using markdown).

3. Run `rake process_audio`.  This will
  * Rename the audio file to the correct format: Eric and Mitch Explain 009 - Sweet Podcast Title
  * (Planned) Write the appropriate ID3 tags to the file.
  * (Planned) Embed artwork in the mp3 file.
  * (Planned) Put the size of the audio file into the episode file.

3. Upload the resulting file in the finalized_audio_files directory to Dropbox (or whereever) and copy the public URL for the file.

4. Put the public URL for the audio file in the episode file yaml header:

    ---
    file: http://public-url.com/009-whatever.mp3
    ---

5. Build the static site: `rake build`

6. Deploy the site: 'rake deploy'
