import 'package:flutter/material.dart';
import React, { useState, useEffect } from "react";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Table, TableHead, TableRow, TableCell, TableBody } from "@/components/ui/table";

const parkingSpots = 50;

const SmartParkingDashboard = () => {
const [availableSpots, setAvailableSpots] = useState(parkingSpots);
const [logs, setLogs] = useState([]);

useEffect(() => {
// Fetch real-time parking data (Mock API call)
fetch("/api/parking-data")
    .then((res) => res.json())
    .then((data) => {
setAvailableSpots(data.availableSpots);
setLogs(data.logs);
});
}, []);

return (
<div className="p-6">
<h1 className="text-2xl font-bold mb-4">Smart Car Parking System</h1>

<Card className="mb-4 p-4 shadow-lg">
<CardContent>
<h2 className="text-xl font-semibold">Available Parking Spots: {availableSpots}</h2>
</CardContent>
</Card>

<Card className="mb-4 p-4 shadow-lg">
<CardContent>
<h2 className="text-xl font-semibold mb-2">Entry/Exit Logs</h2>
<Table>
<TableHead>
<TableRow>
<TableCell>Vehicle Number</TableCell>
<TableCell>Entry Time</TableCell>
<TableCell>Exit Time</TableCell>
<TableCell>Status</TableCell>
</TableRow>
</TableHead>
<TableBody>
{logs.map((log, index) => (
<TableRow key={index}>
<TableCell>{log.vehicleNumber}</TableCell>
<TableCell>{log.entryTime}</TableCell>
<TableCell>{log.exitTime || "--"}</TableCell>
<TableCell>{log.status}</TableCell>
</TableRow>
))}
</TableBody>
</Table>
</CardContent>
</Card>
</div>
);
};

export default SmartParkingDashboard;
