import React, { useEffect, useState } from "react";
import { useLocation } from "react-router-dom";
import MenuIcon from "@mui/icons-material/Menu";
import { NetflixLogo as NL } from "../assets/Netflix_2015_logo.svg";
import "../styles/Navbar.css";

function Navbar() {
  const [expandNavbar, setExpandNavbar] = useState(false);
  const location = useLocation();

  const handleNavbar = () => {
    setExpandNavbar((prev) => !prev);
  };

  useEffect(() => {
    setExpandNavbar(false);
  }, [location]);

  return (
    <div className="navbar" id={expandNavbar ? "open" : "close"}>
      <NL />
      <MenuIcon />
      Hello from Navbar
      <button onClick={handleNavbar}></button>
    </div>
  );
}

export default Navbar;
