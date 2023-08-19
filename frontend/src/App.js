import { BrowserRouter as Router, Routes } from "react-router-dom";
import Navbar from "./components/Navbar";
import "./App.css";

function App() {
  return (
    <div className="App">
      <Router>
        <Navbar />
        <Routes>
          {/*<Route path="/" element={<Profiles />} /> */}
          {/*<Route path="/browser" element={<Browser />} /> */}
        </Routes>
      </Router>
    </div>
  );
}

export default App;
