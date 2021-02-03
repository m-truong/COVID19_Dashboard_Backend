# COVID-19 Information Portal

---

![COVID-19 Dashboard App](https://www.cbp.gov/sites/default/files/covidimage2.png)

---

### Motivation:

The COVID-19 global pandemic is one of the worst health crises in history, and it has infected and killed millions of people. I wanted to build a COVID-19 Dashboard App to visually display real-time cases, deaths, and recovered data using React-Chartjs-2, React-Leaflet, and the Disease.sh COVID-19 API database. My COVID-19 Dashboard is inspired by the John Hopkins COVID-19 Map (https://coronavirus.jhu.edu/map.html), as well as CNN's news coverage of daily COVID-19 cases. I'm a fan of the Resident Evil video game series (https://www.residentevil.com/), so my COVID-19 dashboard app also takes visual inspiration from the series to convey the severity and horror of the global COVID-19 crisis.

---

### Project Summary:

My COVID-19 Dashboard has two dashboard pages that renders a React-Leaflet interactive map that visitors can zoom, drag, and click on to display the total cases, deaths, and recovered statistics for Worldwide and United States COVID-19 data. The dashboard pages also render stats tables that display the total cumulative cases, deaths, and recovered data for every country and state. The graphs page renders two line graphs using React-Chartjs-2 displaying the rise in daily new COVID-19 cases in the past 120 days. The videos page displays playable YouTube videos with information on COVID-19 biology, vaccine research, and best practices on staying safe during the pandemic. Visitors can also go to my register and login pages to create a username and password that communicates with my RubyOnRails backend server using JWT authentication.

**Link to COVID-19 Dashboard Frontend:** 
(https://covid19-dashboard-frontend-app.herokuapp.com/)

**Link to COVID-19 Dashboard Backend:** 
(https://covid19-dashboard-backend-api.herokuapp.com/)

---

### Features:

- I fetched the COVID-19 data from the Disease.sh third-party global disease API (https://disease.sh/). I was able to dynamically draw interactable React-Leaflet Circle components using the total cases data for every country and state. I also was able to render a dark-themed map TileLayer in React-Leaflet.
- While using Postman to explore the Disease.sh API, I realized that the API endpoint for 'states' data did not contain information with latitude and longitude properties for all 50 states. I needed latitude and longitude coordinates in order to draw Circle components from React-Leaflet, so I used LatLong.net to create my own array of 'states' objects with latitude and longitude properties on them. I mapped over the 'states' data from the Disease.sh and added in those latitude and longitude properties. 
- I used React-Chartjs-2 to draw line graphs of daily new cases worldwide and in the United States. React-Chartjs-2's Line-graph component allowed me to pass down custom options and data rendering the rise in daily new cases.
- I used 'React-Tweets' to render live tweets that I fetched from the Twitter Developer's API (https://api.twitter.com/1.1/search/tweets.json). I displayed tweets as part of my News Feed page with more information about recent news on the coronavirus pandemic.
- I used the 'Styled-Components' library to create a lot of reusable React components. This allowed me to build my React app based on the composition model to keep it modular and scalable. 
- I created a very useful 'Utilities.js' file that contained most of my important helper functions and extra data. I imported my 'statesArray' with latitude and longitude properties, my custom React 'styled-components', and my 'drawCovidCircles', 'sortTableData', etc. functions from my 'Utilities.js' file in order to make them available throughout my React app. 
- I used React-Player to display YouTube videos with additional information on the global COVID-19 pandemic.
- I added an animated video background of the coronavirus strain that plays while visitors are browsing my app. 
- My COVID-19 dashboard app also uses RubyOnRails as the backend with JWT authentication for visitors to regiser and login with a username and password.

---

### Code Examples:

For my dashboard pages, I utilized React-Bootstrap to help display my react components using Bootstrap's Container, Row, and Col components. This helped better organize my react components very cleanly without having to add a lot of CSS styling rules to format my components. React-Bootstrap's grid layout helped me to focus on building reusable and scalable components, such as my DataCard and StatsTable components, that I could render consistently across all my React-Router pages. 

```
<Container fluid>
    <Title>COVID-19 Worldwide Dashboard </Title>
    <Row className="justify-content-around">
        <Col className="col-margin-top" md={2}>
            <DataCard title={"Cases"} stat={worldData.cases} />
            <StatsTable name="Countries" region={casesTableData} type="Cases" />
        </Col>
        <Col md={6}>
            <CovidLiveMap covidCircleData={countriesData} type="Worldwide" />
        </Col>
        <Col className="col-margin-top" md={2}>
            <DataCard title={"Deaths"} stat={worldData.deaths} />
            <StatsTable name="Countries" region={deathsTableData} type="Deaths" />
        </Col>
        <Col className="col-margin-top" md={2}>
            <DataCard title={"Recovered"} stat={worldData.recovered} />
            <StatsTable name="Countries" region={recoveredTableData} type="Recovered" />
        </Col>
    </Row>
</Container>
```

I enjoyed using 'Styled-Components' to streamline my CSS styling without having to add lots of CSS classNames to my React app. It also helped keep my App.css clean and easy to read. Using 'styled-components' allowed me to create reusable components with similar styling across all my pages. 

```
export const Box = styled.div`
    border: 0.15rem #2E2F2F solid;
    background-color: #43464B;
    border-radius: 1.1rem;
    margin: 0.5rem;
    padding: 1rem;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24); 
    transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
    &hover: {
        box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22); 
    }
`;
```

I used my 'Utilities.js' file to store important helper functions that I needed to make accessible throughout my React app. I exported my 'drawCovidCircles' helper function to my CovidLiveMap.js component to draw Circle components from React-Leaflet using cases numbers from the Disease.sh API database. 

```
export const drawCovidCircles = (covidCircleData, type) => {
    return (
        covidCircleData.map((regionObj, idx) => (
            <Circle
                key={idx}
                pathOptions={circleColors.option}
                radius={type === "Worldwide" ? Math.sqrt(regionObj.cases) * 400 : Math.sqrt(regionObj.cases) * 250}
                fillOpacity={0.4}
                center={[regionObj.countryInfo.lat, regionObj.countryInfo.long]}
            >
                <Popup>
                    <PopupBox>
                        <PopupStat size="Heading" >
                            {regionObj.country}
                        </PopupStat>
                        <PopupStat type="Cases">
                            Cases: {numeral(regionObj.cases).format("0,0")}
                        </PopupStat>
                        <PopupStat type="Deaths">
                            Deaths: {numeral(regionObj.deaths).format("0,0")}
                        </PopupStat>
                        <PopupStat type="Recovered">
                            Recovered: {numeral(regionObj.recovered).format("0,0")}
                        </PopupStat>
                    </PopupBox>
                </Popup>
            </Circle >
        )))
};
```
With a lot of help from my instructor Arthur, I was able fetch live tweets from the Twitter Developer API and render them in my React app News Feed page with the 'React-Tweet' npm package. 

```
app.get('/tweets/getTweets', async (req, res) => {
  try {
    const tweets = await axios({
      url: `https://api.twitter.com/1.1/search/tweets.json?q=%40cdcgov&result_type=popular&count=3&lang=en`,
      method: 'GET',
      headers: {
        Authorization: `Bearer AAAAAAAAAAAAAAAAAAAAAPw1MQEAAAAA%2BnKaVgyRfG4TfnfvC6Ss8boCUow%3Dj9CVdyRgXy52MbBgLW47gdxRtlF875buXqTHIiGBsq7FFMVRrb`,
        'Content-Type': 'application/json',
      },
    })
    res.status(200).json(tweets.data)
  } catch (error) {
    res.status(400).json(error)
  }
})
```
---

### API Reference:

(https://disease.sh/docs/)

### Technologies used:

- Disease.sh API Library (https://disease.sh/docs/)
- React-Leaflet and Leaflet (https://react-leaflet.js.org/)
- React-Chartjs-2 and Chart.js (https://www.npmjs.com/package/react-chartjs-2)
- LatLong.net (https://www.latlong.net/category/states-236-14.html)
- React-Player (https://www.npmjs.com/package/react-player)
- React-Router-DOM (https://reactrouter.com/)
- React-Bootstrap (https://react-bootstrap.github.io/)
- React-Tweet (https://github.com/mannynotfound/react-tweet)
- Twitter Developer API (https://developer.twitter.com/en/docs/twitter-api)
- Styled-Components (https://styled-components.com/)
- Numeral.js (http://numeraljs.com/)
- GitLFS package (https://git-lfs.github.com/)
- COVID-19 Animated Background Video (https://www.youtube.com/watch?v=WNG7X3-_HJE)
- Heroku (https://www.heroku.com/)

---

## Wireframes

I uploaded my wireframe images and added the links here.

![Link](https://res.cloudinary.com/mtruong/image/upload/v1612151577/COVID-19_Map_Dashboard_Wireframe-Dashboard_Page_ns1frg.png)

![Link](https://res.cloudinary.com/mtruong/image/upload/v1612151577/COVID-19_Map_Dashboard_Wireframe-Daily_Cases_Page_afqznt.png)

![Link](https://res.cloudinary.com/mtruong/image/upload/v1612151577/COVID-19_Map_Dashboard_Wireframe-YouTube_Videos_Page_l8ukqk.png)

![Link](https://res.cloudinary.com/mtruong/image/upload/v1612151577/COVID-19_Map_Dashboard_Wireframe-Login_Signup_Page_nympfi.png)

---

## Future Project Improvements:

1. Add a Twitter API that fetches tweets from @CDCgov and @CNN with updates and information on COVID-19
2. Add more Chart.js graphs that render different trends in COVID-19 data for different age and socio-economic groups
3. Add a dropdown to select a specific country or state and render it's total cases, deaths, and recovered on the datacards and change the zoom of the map to the region's latitude and longitude on the Leaflet map
---

## Lessons/Ongoing Issues:

### Rendering more COVID-19 Chart.js graphs 

- I originally hoped to use React-Chartjs-2 to render graphs to display trends in COVID-19 cases based on different factors such as socioeconomic status, access to healthcare, and exposure to the virus based on occupation, travel, etc.
- But the Disease.sh third-party COVID-19 API database didn't have special populations data based on these criteria

---

## Issues and Resolutions

#### List of Errors.....

**ERROR**:
1. Failed to load resource: net::ERR_BLOCKED_BY_CLIENT
2. remote: error: GH001: Large files detected. You may want to try Git Large File Storage - https://git-lfs.github.com.

**RESOLUTION**:
1. This error seems to be due to a browser extension blocking the request to render the YouTube videos on my videos page. Visitors with an ad blocker extension will encounter this error. 
2. This error occurred when I was staging and attempting to push up my large .mp4 video file. GitHub's file size limit is ~100.00MB, so I had to use Git Large File Storage in order to push up my large audio and media files. I had to locally delete my large files, and do a git reset --soft back a number of commits to before I committed my large files. Then I was able to squash all my recent updates into a single commit with the large files removed from my commit history. 
- Source (https://stackoverflow.com/questions/19573031/cant-push-to-github-because-of-large-file-which-i-already-deleted)
---

## Credits:
- John Hopkins COVID-19 Map (https://coronavirus.jhu.edu/map.html)
- CNN COVID-19 Cases Dashboard (https://www.cnn.com/interactive/2020/health/coronavirus-us-maps-and-cases/)
- COVID-19 Tracker YouTube Inspiration (https://www.youtube.com/watch?v=cF3pIMJUZxM)
- My GA-instructor Arthur (https://github.com/arthurbernierjr) helped me understand how to fetch tweets from the Twitter Developer's API 