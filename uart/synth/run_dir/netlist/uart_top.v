/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : M-2016.12-SP2
// Date      : Wed Jul  4 09:45:34 2018
/////////////////////////////////////////////////////////////


module uart_top ( wb_clk_i, wb_rst_i, wb_adr_i, wb_dat_i, wb_dat_o, wb_we_i, 
        wb_stb_i, wb_cyc_i, wb_ack_o, wb_sel_i, int_o, stx_pad_o, srx_pad_i, 
        rts_pad_o, cts_pad_i, dtr_pad_o, dsr_pad_i, ri_pad_i, dcd_pad_i );
  input [2:0] wb_adr_i;
  input [7:0] wb_dat_i;
  output [7:0] wb_dat_o;
  input [3:0] wb_sel_i;
  input wb_clk_i, wb_rst_i, wb_we_i, wb_stb_i, wb_cyc_i, srx_pad_i, cts_pad_i,
         dsr_pad_i, ri_pad_i, dcd_pad_i;
  output wb_ack_o, int_o, stx_pad_o, rts_pad_o, dtr_pad_o;
  wire   wb_interface_wb_we_is, wb_interface_N14, wb_interface_wb_cyc_is,
         wb_interface_wb_stb_is, wb_interface_wre, regs_N399, regs_N398,
         regs_N397, regs_N396, regs_N383, regs_N370, regs_ti_int_pnd,
         regs_N364, regs_ms_int_pnd, regs_N358, regs_thre_int_pnd, regs_N351,
         regs_rda_int_pnd, regs_N342, regs_rls_int_pnd, regs_ti_int_d,
         regs_ms_int_d, regs_thre_int_d, regs_rda_int_d, regs_rls_int_d,
         regs_ti_int, regs_ms_int, regs_thre_int, regs_rda_int, regs_rls_int,
         regs_N224, regs_N223, regs_N222, regs_N221, regs_N220, regs_N219,
         regs_N218, regs_N217, regs_N216, regs_N215, regs_N214, regs_N213,
         regs_N212, regs_N211, regs_N210, regs_N209, regs_N208, regs_N171,
         regs_lsr7_d, regs_N167, regs_lsr6_d, regs_N165, regs_lsr5_d,
         regs_N162, regs_lsr4_d, regs_N158, regs_lsr3_d, regs_N154,
         regs_lsr2_d, regs_N150, regs_lsr1_d, regs_N146, regs_lsr0_d,
         regs_lsr7, regs_lsr6, regs_lsr5, regs_lsr0, regs_N142, regs_N141,
         regs_N140, regs_N139, regs_N125, regs_N124, regs_start_dlc, regs_N117,
         regs_N116, regs_msi_reset, regs_lsr_mask_d, regs_lsr_mask_condition,
         regs_rx_reset, regs_rf_overrun, regs_rf_pop, regs_srx_pad,
         regs_tx_reset, regs_enable, regs_tf_push, regs_cts_c, regs_dsr_c,
         regs_ri_c, regs_dcd_c, regs_transmitter_parity_xor,
         regs_transmitter_bit_out, regs_transmitter_stx_o_tmp,
         regs_transmitter_tf_pop, regs_i_uart_sync_flops_flop_0_0_,
         regs_receiver_rf_push_q, regs_receiver_rf_push, regs_receiver_rparity,
         regs_receiver_rparity_error, regs_receiver_rframing_error,
         regs_receiver_rparity_xor, n1020, n1021, n1022, n1023, n1024, n1025,
         n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035,
         n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1172, n1173,
         n1174, n1175, n1176, n1304, n1305, n1306, n1307, n1308, n1309, n1310,
         n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318, n1319, n1320,
         n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329, n1330,
         n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338, n1339, n1340,
         n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349, n1350,
         n1351, n1352, n1353, n1354, n1355, n1356, n1357, n1358, n1359, n1360,
         n1361, n1362, n1363, n1364, n1365, n1366, n1367, n1368, n1369, n1370,
         n1371, n1372, n1373, n1374, n1375, n1376, n1377, n1378, n1379, n1380,
         n1381, n1382, n1383, n1384, n1385, n1386, n1387, n1388, n1389, n1390,
         n1391, n1392, n1393, n1394, n1395, n1396, n1397, n1398, n1399, n1400,
         n1401, n1402, n1403, n1404, n1405, n1406, n1407, n1408, n1409, n1410,
         n1411, n1412, n1413, n1414, n1415, n1416, n1417, n1418, n1419, n1420,
         n1421, n1422, n1423, n1424, n1425, n1426, n1427, n1428, n1429, n1430,
         n1431, n1432, n1433, n1434, n1435, n1436, n1437, n1438, n1439, n1440,
         n1441, n1442, n1443, n1444, n1445, n1446, n1447, n1448, n1449, n1450,
         n1451, n1452, n1453, n1454, n1455, n1456, n1458, n1459, n1460, n1461,
         n1462, n1463, n1464, n1465, n1466, n1467, n1468, n1469, n1470, n1471,
         n1472, n1473, n1474, n1475, n1476, n1477, n1478, n1479, n1480, n1481,
         n1482, n1483, n1484, n1485, n1487, n1488, n1489, n1490, n1491, n1492,
         n1493, n1494, n1495, n1496, n1497, n1498, n1499, n1500, n1501, n1502,
         n1503, n1504, n1505, n1506, n1507, n1508, n1509, n1510, n1511, n1512,
         n1513, n1514, n1515, n1516, n1517, n1518, n1519, n1520, n1521, n1522,
         n1523, n1524, n1525, n1526, n1527, n1528, n1529, n1530, n1531, n1532,
         n1533, n1534, n1535, n1536, n1537, n1538, n1539, n1540, n1541, n1542,
         n1543, n1545, n1546, n1547, n1548, n1549, n1550, n1551, n1552, n1553,
         n1554, n1555, n1557, n1558, n1559, n1560, n1561, n1562, n1563, n1564,
         n1567, n1568, n1569, n1570, n1571, n1572, n1573, n1574, n1575, n1576,
         n1577, n1578, n1579, n1580, n1581, n1582, n1583, n1584, n1585, n1586,
         n1587, n1588, n1589, n1590, n1591, n1592, n1593, n1594, n1595, n1596,
         n1597, n1598, n1599, n1600, n1601, n1602, n1603, n1604, n1605, n1606,
         n1607, n1608, n1609, n1610, n1611, n1612, n1613, n1614, n1615, n1616,
         n1617, n1618, n1619, n1620, n1621, n1622, n1623, n1624, n1625, n1626,
         n1627, n1628, n1629, n1630, n1631, n1632, n1633, n1634, n1635, n1636,
         n1637, n1638, n1639, n1641, n1642, n1643, n1644, n1645, n1646, n1647,
         n1648, n1649, n1650, n1651, n1652, n1653, n1654, n1655, n1656, n1657,
         n1658, n1659, n1660, n1661, n1662, n1663, n1664, n1665, n1666, n1667,
         n1668, n1669, n1670, n1671, n1672, n1673, n1674, n1675, n1676, n1677,
         n1678, n1679, n1680, n1681, n1682, n1683, n1684, n1685, n1686, n1687,
         n1688, n1689, n1690, n1691, n1692, n1693, n1694, n1695, n1696, n1697,
         n1699, n1701, n1703, n1705, n1706, n1707, n1708, n1709, n1710, n1711,
         n1712, n1713, n1714, n1715, n1716, n1717, n1718, n1719, n1720, n1721,
         n1722, n1723, n1724, n1725, n1726, n1727, n1728, n1729, n1730, n1731,
         n1732, n1733, n1734, n1735, n1736, n1737, n1738, n1739, n1740, n1741,
         n1742, n1743, n1744, n1745, n1746, n1747, n1748, n1749, n1750, n1751,
         n1752, n1753, n1754, n1755, n1756, n1757, n1758, n1759, n1760, n1761,
         n1762, n1763, n1764, n1765, n1766, n1767, n1768, n1769, n1770, n1771,
         n1772, n1773, n1774, n1775, n1776, n1777, n1778, n1779, n1780, n1781,
         n1782, n1783, n1784, n1785, n1786, n1787, n1788, n1789, n1790, n1791,
         n1792, n1793, n1794, n1795, n1796, n1797, n1798, n1799, n1800, n1801,
         n1802, n1803, n1804, n1805, n1806, n1807, n1808, n1809, n1810, n1811,
         n1812, n1813, n1814, n1815, n1816, n1817, n1818, n1819, n1820, n1821,
         n1822, n1823, n1824, n1825, n1826, n1827, n1828, n1829, n1830, n1831,
         n1832, n1833, n1834, n1835, n1836, n1837, n1838, n1839, n1840, n1841,
         n1842, n1843, n1844, n1845, n1847, n1848, n1849, n1850, n1851, n1852,
         n1853, n1854, n1855, n1856, n1857, n1858, n1859, n1860, n1861, n1862,
         n1863, n1864, n1865, n1866, n1867, n1868, n1869, n1870, n1871, n1872,
         n1873, n1874, n1875, n1876, n1877, n1878, n1879, n1880, n1881, n1882,
         n1883, n1884, n1885, n1886, n1887, n1888, n1889, n1890, n1891, n1892,
         n1893, n1894, n1895, n1896, n1897, n1898, n1899, n1900, n1901, n1902,
         n1903, n1904, n1905, n1906, n1907, n1908, n1909, n1910, n1911, n1912,
         n1913, n1914, n1915, n1916, n1917, n1918, n1919, n1920, n1921, n1922,
         n1923, n1924, n1925, n1926, n1927, n1928, n1929, n1930, n1931, n1932,
         n1933, n1934, n1935, n1936, n1937, n1938, n1939, n1940, n1941, n1942,
         n1943, n1944, n1945, n1946, n1947, n1948, n1949, n1950, n1951, n1952,
         n1953, n1954, n1955, n1956, n1957, n1958, n1959, n1960, n1961, n1962,
         n1963, n1964, n1965, n1966, n1967, n1968, n1969, n1970, n1971, n1972,
         n1973, n1974, n1975, n1976, n1977, n1978, n1979, n1980, n1981, n1982,
         n1983, n1984, n1985, n1986, n1987, n1988, n1989, n1990, n1991, n1992,
         n1993, n1994, n1995, n1996, n1997, n1998, n1999, n2000, n2001, n2002,
         n2003, n2004, n2005, n2006, n2007, n2008, n2009, n2010, n2011, n2012,
         n2013, n2014, n2015, n2016, n2017, n2018, n2019, n2020, n2021, n2022,
         n2023, n2024, n2025, n2026, n2027, n2028, n2029, n2030, n2031, n2032,
         n2033, n2034, n2035, n2036, n2037, n2038, n2039, n2040, n2041, n2042,
         n2043, n2044, n2045, n2046, n2047, n2048, n2049, n2050, n2051, n2052,
         n2053, n2054, n2055, n2056, n2057, n2058, n2059, n2060, n2061, n2062,
         n2063, n2064, n2065, n2066, n2067, n2068, n2069, n2070, n2071, n2072,
         n2073, n2074, n2075, n2076, n2077, n2078, n2079, n2080, n2081, n2082,
         n2083, n2084, n2085, n2086, n2087, n2089, n2090, n2091, n2092, n2093,
         n2094, n2095, n2096, n2097, n2098, n2099, n2100, n2101, n2102, n2103,
         n2104, n2105, n2106, n2107, n2108, n2109, n2110, n2111, n2112, n2113,
         n2115, n2116, n2117, n2118, n2119, n2120, n2121, n2122, n2123, n2124,
         n2125, n2126, n2127, n2128, n2129, n2130, n2131, n2132, n2133, n2134,
         n2135, n2136, n2137, n2138, n2139, n2140, n2141, n2142, n2143, n2144,
         n2145, n2146, n2147, n2148, n2149, n2150, n2151, n2152, n2153, n2154,
         n2155, n2156, n2157, n2158, n2159, n2160, n2161, n2162, n2163, n2164,
         n2165, n2166, n2167, n2168, n2169, n2170, n2171, n2172, n2173, n2174,
         n2175, n2176, n2177, n2178, n2179, n2180, n2181, n2182, n2183, n2184,
         n2185, n2186, n2187, n2188, n2189, n2190, n2191, n2192, n2193, n2194,
         n2195, n2196, n2197, n2198, n2199, n2200, n2201, n2202, n2203, n2204,
         n2205, n2206, n2207, n2208, n2209, n2210, n2211, n2212, n2213, n2214,
         n2215, n2216, n2217, n2218, n2219, n2220, n2221, n2222, n2223, n2224,
         n2225, n2226, n2227, n2228, n2229, n2230, n2231, n2232, n2233, n2234,
         n2235, n2236, n2237, n2238, n2239, n2240, n2241, n2242, n2243, n2244,
         n2245, n2246, n2247, n2248, n2249, n2250, n2251, n2252, n2253, n2254,
         n2255, n2256, n2257, n2258, n2259, n2260, n2261, n2262, n2263, n2264,
         n2265, n2266, n2267, n2268, n2269, n2270, n2271, n2272, n2273, n2274,
         n2275, n2276, n2277, n2278, n2279, n2280, n2281, n2282, n2283, n2284,
         n2285, n2286, n2287, n2288, n2289, n2290, n2291, n2292, n2293, n2294,
         n2295, n2296, n2297, n2298, n2299, n2300, n2301, n2302, n2303, n2304,
         n2305, n2306, n2307, n2308, n2309, n2310, n2311, n2312, n2313, n2314,
         n2315, n2316, n2317, n2318, n2319, n2320, n2321, n2322, n2323, n2324,
         n2325, n2326, n2327, n2328, n2329, n2330, n2331, n2332, n2333, n2334,
         n2335, n2336, n2337, n2338, n2339, n2340, n2341, n2342, n2343, n2344,
         n2345, n2346, n2347, n2348, n2349, n2350, n2351, n2352, n2353, n2354,
         n2355, n2356, n2357, n2358, n2359, n2360, n2361, n2362, n2363, n2364,
         n2365, n2366, n2367, n2368, n2369, n2370, n2371, n2372, n2373, n2374,
         n2375, n2376, n2377, n2378, n2379, n2380, n2381, n2382, n2383, n2384,
         n2385, n2386, n2387, n2388, n2389, n2390, n2391, n2392, n2393, n2394,
         n2395, n2396, n2397, n2398, n2399, n2400, n2401, n2402, n2403, n2404,
         n2405, n2406, n2407, n2408, n2409, n2410, n2411, n2412, n2413, n2414,
         n2415, n2416, n2417, n2418, n2419, n2420, n2421, n2422, n2423, n2424,
         n2425, n2426, n2427, n2428, n2429, n2430, n2431, n2432, n2433, n2434,
         n2435, n2436, n2438, n2439, n2440, n2441, n2442, n2443, n2444, n2445,
         n2446, n2447, n2448, n2449, n2450, n2451, n2452, n2453, n2454, n2455,
         n2456, n2457, n2458, n2459, n2460, n2461, n2462, n2463, n2464, n2465,
         n2466, n2467, n2468, n2469, n2470, n2471, n2472, n2473, n2474, n2476,
         n2477, n2479, n2480, n2482, n2483, n2485, n2487, n2489, n2491, n2492,
         n2494, n2496, n2498, n2500, n2501, n2502, n2504, n2505, n2507, n2508,
         n2510, n2511, n2512, n2514, n2516, n2517, n2518, n2519, n2520, n2521,
         n2522, n2523, n2524, n2525, n2526, n2527, n2528, n2529, n2530, n2531,
         n2532, n2533, n2534, n2535, n2536, n2537, n2538, n2539, n2541, n2542,
         n2544, n2545, n2547, n2548, n2549, n2551, n2553, n2555, n2557, n2558,
         n2560, n2562, n2564, n2566, n2567, n2569, n2570, n2572, n2573, n2575,
         n2576, n2578, n2579, n2580, n2582, n2583, n2584, n2585, n2586, n2587,
         n2588, n2589, n2590, n2591, n2592, n2593, n2594, n2595, n2596, n2597,
         n2598, n2599, n2600, n2601, n2602, n2603, n2604, n2605, n2606, n2607,
         n2608, n2609, n2610, n2611, n2612, n2613, n2614, n2615, n2616, n2617,
         n2618, n2619, n2620, n2621, n2622, n2623, n2624, n2625, n2626;
  wire   [7:0] wb_dat8_i;
  wire   [7:0] wb_dat8_o;
  wire   [2:0] wb_adr_int;
  wire   [1:0] wb_interface_wbstate;
  wire   [7:0] regs_block_cnt;
  wire   [15:0] regs_dlc;
  wire   [3:0] regs_delayed_modem_signals;
  wire   [1:0] regs_fcr;
  wire   [7:0] regs_scratch;
  wire   [7:0] regs_msr;
  wire   [3:0] regs_iir;
  wire   [3:0] regs_ier;
  wire   [15:0] regs_dl;
  wire   [3:0] regs_rstate;
  wire   [2:0] regs_rf_data_out;
  wire   [4:0] regs_rf_count;
  wire   [9:0] regs_counter_t;
  wire   [4:0] regs_tf_count;
  wire   [2:0] regs_tstate;
  wire   [7:0] regs_lcr;
  wire   [4:2] regs_mcr;
  wire   [7:0] regs_lsr;
  wire   [2:0] regs_transmitter_bit_counter;
  wire   [6:0] regs_transmitter_shift_out;
  wire   [4:0] regs_transmitter_counter;
  wire   [3:0] regs_transmitter_fifo_tx_bottom;
  wire   [3:0] regs_transmitter_fifo_tx_top;
  wire   [7:0] regs_receiver_rshift;
  wire   [2:0] regs_receiver_rbit_counter;
  wire   [3:0] regs_receiver_rcounter16;
  wire   [10:0] regs_receiver_rf_data_in;
  wire   [7:0] regs_receiver_counter_b;
  wire   [47:0] regs_receiver_fifo_rx_fifo;
  wire   [3:0] regs_receiver_fifo_rx_bottom;
  wire   [3:0] regs_receiver_fifo_rx_top;
  wire   [127:0] regs_transmitter_fifo_tx_tfifo_ram;
  wire   [127:0] regs_receiver_fifo_rx_rfifo_ram;

  DFFRPQ_X1M_A9TH wb_interface_wb_stb_is_reg ( .D(wb_stb_i), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(wb_interface_wb_stb_is) );
  DFFRPQ_X1M_A9TH wb_interface_wb_cyc_is_reg ( .D(wb_cyc_i), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(wb_interface_wb_cyc_is) );
  DFFRPQ_X1M_A9TH wb_interface_wb_we_is_reg ( .D(wb_we_i), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(wb_interface_wb_we_is) );
  DFFRPQ_X1M_A9TH wb_interface_wb_adr_is_reg_0_ ( .D(wb_adr_i[0]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_adr_int[0]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_adr_is_reg_1_ ( .D(wb_adr_i[1]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_adr_int[1]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_adr_is_reg_2_ ( .D(wb_adr_i[2]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_adr_int[2]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_dat_is_reg_0_ ( .D(wb_dat_i[0]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_dat8_i[0]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_dat_is_reg_1_ ( .D(wb_dat_i[1]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_dat8_i[1]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_dat_is_reg_2_ ( .D(wb_dat_i[2]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_dat8_i[2]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_dat_is_reg_3_ ( .D(wb_dat_i[3]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_dat8_i[3]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_dat_is_reg_4_ ( .D(wb_dat_i[4]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_dat8_i[4]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_dat_is_reg_5_ ( .D(wb_dat_i[5]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_dat8_i[5]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_dat_is_reg_6_ ( .D(wb_dat_i[6]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_dat8_i[6]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_dat_is_reg_7_ ( .D(wb_dat_i[7]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_dat8_i[7]) );
  DFFRPQ_X1M_A9TH wb_interface_wbstate_reg_1_ ( .D(n1481), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(wb_interface_wbstate[1]) );
  DFFRPQ_X1M_A9TH wb_interface_wbstate_reg_0_ ( .D(n1480), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(wb_interface_wbstate[0]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_ack_o_reg ( .D(n1480), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(wb_ack_o) );
  DFFRPQ_X1M_A9TH regs_dlc_reg_0_ ( .D(regs_N208), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_dlc[0]) );
  DFFRPQ_X1M_A9TH regs_dlc_reg_1_ ( .D(regs_N209), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_dlc[1]) );
  DFFRPQ_X1M_A9TH regs_dlc_reg_2_ ( .D(regs_N210), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_dlc[2]) );
  DFFRPQ_X1M_A9TH regs_dlc_reg_3_ ( .D(regs_N211), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_dlc[3]) );
  DFFRPQ_X1M_A9TH regs_dlc_reg_4_ ( .D(regs_N212), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_dlc[4]) );
  DFFRPQ_X1M_A9TH regs_dlc_reg_5_ ( .D(regs_N213), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_dlc[5]) );
  DFFRPQ_X1M_A9TH regs_dlc_reg_6_ ( .D(regs_N214), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_dlc[6]) );
  DFFRPQ_X1M_A9TH regs_dlc_reg_7_ ( .D(regs_N215), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_dlc[7]) );
  DFFRPQ_X1M_A9TH regs_dlc_reg_8_ ( .D(regs_N216), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_dlc[8]) );
  DFFRPQ_X1M_A9TH regs_dlc_reg_9_ ( .D(regs_N217), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_dlc[9]) );
  DFFRPQ_X1M_A9TH regs_dlc_reg_10_ ( .D(regs_N218), .CK(wb_clk_i), .R(wb_rst_i), .Q(regs_dlc[10]) );
  DFFRPQ_X1M_A9TH regs_dlc_reg_11_ ( .D(regs_N219), .CK(wb_clk_i), .R(wb_rst_i), .Q(regs_dlc[11]) );
  DFFRPQ_X1M_A9TH regs_dlc_reg_12_ ( .D(regs_N220), .CK(wb_clk_i), .R(wb_rst_i), .Q(regs_dlc[12]) );
  DFFRPQ_X1M_A9TH regs_dlc_reg_13_ ( .D(regs_N221), .CK(wb_clk_i), .R(wb_rst_i), .Q(regs_dlc[13]) );
  DFFRPQ_X1M_A9TH regs_dlc_reg_14_ ( .D(regs_N222), .CK(wb_clk_i), .R(wb_rst_i), .Q(regs_dlc[14]) );
  DFFRPQ_X1M_A9TH regs_dlc_reg_15_ ( .D(regs_N223), .CK(wb_clk_i), .R(wb_rst_i), .Q(regs_dlc[15]) );
  DFFRPQ_X1M_A9TH regs_delayed_modem_signals_reg_0_ ( .D(n1482), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_delayed_modem_signals[0]) );
  DFFRPQ_X1M_A9TH regs_delayed_modem_signals_reg_1_ ( .D(n1483), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_delayed_modem_signals[1]) );
  DFFRPQ_X1M_A9TH regs_delayed_modem_signals_reg_2_ ( .D(n1484), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_delayed_modem_signals[2]) );
  DFFRPQ_X1M_A9TH regs_delayed_modem_signals_reg_3_ ( .D(n1485), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_delayed_modem_signals[3]) );
  DFFRPQ_X1M_A9TH regs_msr_reg_7_ ( .D(regs_dcd_c), .CK(wb_clk_i), .R(wb_rst_i), .Q(regs_msr[7]) );
  DFFRPQ_X1M_A9TH regs_msr_reg_6_ ( .D(regs_ri_c), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_msr[6]) );
  DFFRPQ_X1M_A9TH regs_msr_reg_5_ ( .D(regs_dsr_c), .CK(wb_clk_i), .R(wb_rst_i), .Q(regs_msr[5]) );
  DFFRPQ_X1M_A9TH regs_msr_reg_4_ ( .D(regs_cts_c), .CK(wb_clk_i), .R(wb_rst_i), .Q(regs_msr[4]) );
  DFFRPQ_X1M_A9TH regs_rx_reset_reg ( .D(regs_N116), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_rx_reset) );
  DFFRPQ_X1M_A9TH regs_tx_reset_reg ( .D(regs_N117), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_tx_reset) );
  DFFRPQ_X1M_A9TH regs_dl_reg_0_ ( .D(n1479), .CK(wb_clk_i), .R(wb_rst_i), .Q(
        regs_dl[0]) );
  DFFRPQ_X1M_A9TH regs_dl_reg_1_ ( .D(n1478), .CK(wb_clk_i), .R(wb_rst_i), .Q(
        regs_dl[1]) );
  DFFRPQ_X1M_A9TH regs_dl_reg_2_ ( .D(n1477), .CK(wb_clk_i), .R(wb_rst_i), .Q(
        regs_dl[2]) );
  DFFRPQ_X1M_A9TH regs_dl_reg_3_ ( .D(n1476), .CK(wb_clk_i), .R(wb_rst_i), .Q(
        regs_dl[3]) );
  DFFRPQ_X1M_A9TH regs_dl_reg_4_ ( .D(n1475), .CK(wb_clk_i), .R(wb_rst_i), .Q(
        regs_dl[4]) );
  DFFRPQ_X1M_A9TH regs_dl_reg_5_ ( .D(n1474), .CK(wb_clk_i), .R(wb_rst_i), .Q(
        regs_dl[5]) );
  DFFRPQ_X1M_A9TH regs_dl_reg_6_ ( .D(n1473), .CK(wb_clk_i), .R(wb_rst_i), .Q(
        regs_dl[6]) );
  DFFRPQ_X1M_A9TH regs_dl_reg_7_ ( .D(n1472), .CK(wb_clk_i), .R(wb_rst_i), .Q(
        regs_dl[7]) );
  DFFRPQ_X1M_A9TH regs_start_dlc_reg ( .D(regs_N125), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_start_dlc) );
  DFFRPQ_X1M_A9TH regs_dl_reg_8_ ( .D(n1471), .CK(wb_clk_i), .R(wb_rst_i), .Q(
        regs_dl[8]) );
  DFFRPQ_X1M_A9TH regs_dl_reg_10_ ( .D(n1469), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_dl[10]) );
  DFFRPQ_X1M_A9TH regs_dl_reg_11_ ( .D(n1468), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_dl[11]) );
  DFFRPQ_X1M_A9TH regs_dl_reg_12_ ( .D(n1467), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_dl[12]) );
  DFFRPQ_X1M_A9TH regs_dl_reg_13_ ( .D(n1466), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_dl[13]) );
  DFFRPQ_X1M_A9TH regs_dl_reg_14_ ( .D(n1465), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_dl[14]) );
  DFFRPQ_X1M_A9TH regs_dl_reg_15_ ( .D(n1464), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_dl[15]) );
  DFFRPQ_X1M_A9TH regs_enable_reg ( .D(regs_N224), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_enable) );
  DFFRPQ_X1M_A9TH regs_ier_reg_0_ ( .D(n1463), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_ier[0]) );
  DFFRPQ_X1M_A9TH regs_rda_int_d_reg ( .D(regs_rda_int), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_rda_int_d) );
  DFFRPQ_X1M_A9TH regs_ier_reg_1_ ( .D(n1462), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_ier[1]) );
  DFFRPQ_X1M_A9TH regs_ier_reg_2_ ( .D(n1461), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_ier[2]) );
  DFFRPQ_X1M_A9TH regs_ier_reg_3_ ( .D(n1460), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_ier[3]) );
  DFFRPQ_X1M_A9TH regs_tf_push_reg ( .D(regs_N124), .CK(wb_clk_i), .R(wb_rst_i), .Q(regs_tf_push) );
  DFFRPQ_X1M_A9TH regs_msr_reg_0_ ( .D(regs_N139), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_msr[0]) );
  DFFRPQ_X1M_A9TH regs_msr_reg_1_ ( .D(regs_N140), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_msr[1]) );
  DFFRPQ_X1M_A9TH regs_msr_reg_2_ ( .D(regs_N141), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_msr[2]) );
  DFFRPQ_X1M_A9TH regs_msr_reg_3_ ( .D(regs_N142), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_msr[3]) );
  DFFRPQ_X1M_A9TH regs_ms_int_d_reg ( .D(regs_ms_int), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_ms_int_d) );
  DFFRPQ_X1M_A9TH regs_ms_int_pnd_reg ( .D(regs_N364), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_ms_int_pnd) );
  DFFRPQ_X1M_A9TH regs_lsr_mask_d_reg ( .D(regs_lsr_mask_condition), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_lsr_mask_d) );
  DFFRPQ_X1M_A9TH regs_rf_pop_reg ( .D(n1458), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_rf_pop) );
  DFFRPQ_X1M_A9TH regs_transmitter_fifo_tx_count_reg_4_ ( .D(n1441), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_tf_count[4]) );
  DFFRPQ_X1M_A9TH regs_thre_int_d_reg ( .D(regs_thre_int), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_thre_int_d) );
  DFFRPQ_X1M_A9TH regs_block_cnt_reg_1_ ( .D(n1435), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_block_cnt[1]) );
  DFFRPQ_X1M_A9TH regs_block_cnt_reg_0_ ( .D(n1434), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_block_cnt[0]) );
  DFFRPQ_X1M_A9TH regs_block_cnt_reg_2_ ( .D(n1433), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_block_cnt[2]) );
  DFFRPQ_X1M_A9TH regs_block_cnt_reg_3_ ( .D(n1432), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_block_cnt[3]) );
  DFFRPQ_X1M_A9TH regs_block_cnt_reg_4_ ( .D(n1431), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_block_cnt[4]) );
  DFFRPQ_X1M_A9TH regs_block_cnt_reg_5_ ( .D(n1430), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_block_cnt[5]) );
  DFFRPQ_X1M_A9TH regs_block_cnt_reg_6_ ( .D(n1429), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_block_cnt[6]) );
  DFFRPQ_X1M_A9TH regs_block_cnt_reg_7_ ( .D(n1428), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_block_cnt[7]) );
  DFFRPQ_X1M_A9TH regs_transmitter_tstate_reg_0_ ( .D(n1436), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_tstate[0]) );
  DFFRPQ_X1M_A9TH regs_transmitter_counter_reg_0_ ( .D(n1172), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_transmitter_counter[0]) );
  DFFRPQ_X1M_A9TH regs_transmitter_counter_reg_2_ ( .D(n1174), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_transmitter_counter[2]) );
  DFFRPQ_X1M_A9TH regs_transmitter_tstate_reg_2_ ( .D(n1437), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_tstate[2]) );
  DFFRPQ_X1M_A9TH regs_transmitter_tstate_reg_1_ ( .D(n1454), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_tstate[1]) );
  DFFRPQ_X1M_A9TH regs_transmitter_bit_counter_reg_0_ ( .D(n1451), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_transmitter_bit_counter[0]) );
  DFFRPQ_X1M_A9TH regs_transmitter_bit_counter_reg_1_ ( .D(n1450), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_transmitter_bit_counter[1]) );
  DFFRPQ_X1M_A9TH regs_transmitter_bit_counter_reg_2_ ( .D(n1455), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_transmitter_bit_counter[2]) );
  DFFRPQ_X1M_A9TH regs_transmitter_tf_pop_reg ( .D(n1443), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_transmitter_tf_pop) );
  DFFRPQ_X1M_A9TH regs_transmitter_fifo_tx_count_reg_0_ ( .D(n1442), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_tf_count[0]) );
  DFFRPQ_X1M_A9TH regs_transmitter_fifo_tx_count_reg_3_ ( .D(n1440), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_tf_count[3]) );
  DFFRPQ_X1M_A9TH regs_transmitter_fifo_tx_count_reg_2_ ( .D(n1439), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_tf_count[2]) );
  DFFRPQ_X1M_A9TH regs_transmitter_fifo_tx_count_reg_1_ ( .D(n1438), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_tf_count[1]) );
  DFFRPQ_X1M_A9TH regs_transmitter_fifo_tx_bottom_reg_0_ ( .D(n1311), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_transmitter_fifo_tx_bottom[0]) );
  DFFRPQ_X1M_A9TH regs_transmitter_fifo_tx_bottom_reg_1_ ( .D(n1308), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_transmitter_fifo_tx_bottom[1]) );
  DFFRPQ_X1M_A9TH regs_transmitter_fifo_tx_bottom_reg_2_ ( .D(n1309), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_transmitter_fifo_tx_bottom[2]) );
  DFFRPQ_X1M_A9TH regs_transmitter_fifo_tx_bottom_reg_3_ ( .D(n1310), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_transmitter_fifo_tx_bottom[3]) );
  DFFRPQ_X1M_A9TH regs_transmitter_counter_reg_4_ ( .D(n1176), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_transmitter_counter[4]) );
  DFFRPQ_X1M_A9TH regs_transmitter_counter_reg_3_ ( .D(n1175), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_transmitter_counter[3]) );
  DFFRPQ_X1M_A9TH regs_transmitter_counter_reg_1_ ( .D(n1173), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_transmitter_counter[1]) );
  DFFRPQ_X1M_A9TH regs_transmitter_fifo_tx_top_reg_0_ ( .D(n1307), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_transmitter_fifo_tx_top[0]) );
  DFFRPQ_X1M_A9TH regs_transmitter_fifo_tx_top_reg_1_ ( .D(n1304), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_transmitter_fifo_tx_top[1]) );
  DFFRPQ_X1M_A9TH regs_transmitter_fifo_tx_top_reg_2_ ( .D(n1305), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_transmitter_fifo_tx_top[2]) );
  DFFRPQ_X1M_A9TH regs_transmitter_fifo_tx_top_reg_3_ ( .D(n1306), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_transmitter_fifo_tx_top[3]) );
  DFFRPQ_X1M_A9TH regs_transmitter_parity_xor_reg ( .D(n1456), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_transmitter_parity_xor) );
  DFFRPQ_X1M_A9TH regs_transmitter_shift_out_reg_6_ ( .D(n1452), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_transmitter_shift_out[6]) );
  DFFRPQ_X1M_A9TH regs_transmitter_shift_out_reg_5_ ( .D(n1444), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_transmitter_shift_out[5]) );
  DFFRPQ_X1M_A9TH regs_transmitter_shift_out_reg_4_ ( .D(n1445), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_transmitter_shift_out[4]) );
  DFFRPQ_X1M_A9TH regs_transmitter_shift_out_reg_3_ ( .D(n1446), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_transmitter_shift_out[3]) );
  DFFRPQ_X1M_A9TH regs_transmitter_shift_out_reg_2_ ( .D(n1447), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_transmitter_shift_out[2]) );
  DFFRPQ_X1M_A9TH regs_transmitter_shift_out_reg_1_ ( .D(n1448), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_transmitter_shift_out[1]) );
  DFFRPQ_X1M_A9TH regs_transmitter_shift_out_reg_0_ ( .D(n1449), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_transmitter_shift_out[0]) );
  DFFRPQ_X1M_A9TH regs_transmitter_bit_out_reg ( .D(n1453), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_transmitter_bit_out) );
  DFFRPQ_X1M_A9TH regs_receiver_counter_b_reg_5_ ( .D(n1421), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_counter_b[5]) );
  DFFRPQ_X1M_A9TH regs_receiver_counter_b_reg_6_ ( .D(n1420), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_counter_b[6]) );
  DFFRPQ_X1M_A9TH regs_receiver_rstate_reg_3_ ( .D(n1410), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_rstate[3]) );
  DFFRPQ_X1M_A9TH regs_receiver_rstate_reg_1_ ( .D(n1411), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_rstate[1]) );
  DFFRPQ_X1M_A9TH regs_receiver_rstate_reg_0_ ( .D(n1416), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_rstate[0]) );
  DFFRPQ_X1M_A9TH regs_receiver_rcounter16_reg_3_ ( .D(n1406), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rcounter16[3]) );
  DFFRPQ_X1M_A9TH regs_receiver_rstate_reg_2_ ( .D(n1412), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_rstate[2]) );
  DFFRPQ_X1M_A9TH regs_receiver_rbit_counter_reg_2_ ( .D(n1413), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rbit_counter[2]) );
  DFFRPQ_X1M_A9TH regs_receiver_rbit_counter_reg_0_ ( .D(n1415), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rbit_counter[0]) );
  DFFRPQ_X1M_A9TH regs_receiver_rbit_counter_reg_1_ ( .D(n1414), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rbit_counter[1]) );
  DFFRPQ_X1M_A9TH regs_receiver_rcounter16_reg_0_ ( .D(n1409), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rcounter16[0]) );
  DFFRPQ_X1M_A9TH regs_receiver_rcounter16_reg_1_ ( .D(n1408), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rcounter16[1]) );
  DFFRPQ_X1M_A9TH regs_receiver_rcounter16_reg_2_ ( .D(n1407), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rcounter16[2]) );
  DFFRPQ_X1M_A9TH regs_receiver_rparity_reg ( .D(n1418), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_receiver_rparity) );
  DFFRPQ_X1M_A9TH regs_receiver_rframing_error_reg ( .D(n1417), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rframing_error) );
  DFFRPQ_X1M_A9TH regs_receiver_rshift_reg_7_ ( .D(n1397), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_receiver_rshift[7]) );
  DFFRPQ_X1M_A9TH regs_receiver_rshift_reg_6_ ( .D(n1398), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_receiver_rshift[6]) );
  DFFRPQ_X1M_A9TH regs_receiver_rshift_reg_5_ ( .D(n1399), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_receiver_rshift[5]) );
  DFFRPQ_X1M_A9TH regs_receiver_rshift_reg_4_ ( .D(n1400), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_receiver_rshift[4]) );
  DFFRPQ_X1M_A9TH regs_receiver_rshift_reg_3_ ( .D(n1401), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_receiver_rshift[3]) );
  DFFRPQ_X1M_A9TH regs_receiver_rshift_reg_2_ ( .D(n1402), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_receiver_rshift[2]) );
  DFFRPQ_X1M_A9TH regs_receiver_rshift_reg_1_ ( .D(n1403), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_receiver_rshift[1]) );
  DFFRPQ_X1M_A9TH regs_receiver_rshift_reg_0_ ( .D(n1404), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_receiver_rshift[0]) );
  DFFRPQ_X1M_A9TH regs_receiver_rparity_xor_reg ( .D(n1396), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rparity_xor) );
  DFFRPQ_X1M_A9TH regs_receiver_rparity_error_reg ( .D(n1395), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rparity_error) );
  DFFRPQ_X1M_A9TH regs_receiver_rf_push_reg ( .D(n1405), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_receiver_rf_push) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_count_reg_0_ ( .D(n1343), .CK(wb_clk_i), .R(wb_rst_i), .Q(regs_rf_count[0]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_count_reg_4_ ( .D(n1342), .CK(wb_clk_i), .R(wb_rst_i), .Q(regs_rf_count[4]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_count_reg_3_ ( .D(n1341), .CK(wb_clk_i), .R(wb_rst_i), .Q(regs_rf_count[3]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_count_reg_2_ ( .D(n1340), .CK(wb_clk_i), .R(wb_rst_i), .Q(regs_rf_count[2]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_count_reg_1_ ( .D(n1339), .CK(wb_clk_i), .R(wb_rst_i), .Q(regs_rf_count[1]) );
  DFFRPQ_X1M_A9TH regs_rda_int_pnd_reg ( .D(regs_N351), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_rda_int_pnd) );
  DFFRPQ_X1M_A9TH regs_lsr0_d_reg ( .D(regs_lsr0), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_lsr0_d) );
  DFFRPQ_X1M_A9TH regs_lsr0r_reg ( .D(regs_N146), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_lsr[0]) );
  DFFRPQ_X1M_A9TH regs_receiver_counter_t_reg_7_ ( .D(n1331), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_counter_t[7]) );
  DFFRPQ_X1M_A9TH regs_receiver_counter_t_reg_8_ ( .D(n1330), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_counter_t[8]) );
  DFFRPQ_X1M_A9TH regs_ti_int_d_reg ( .D(regs_ti_int), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_ti_int_d) );
  DFFRPQ_X1M_A9TH regs_ti_int_pnd_reg ( .D(regs_N370), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_ti_int_pnd) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_overrun_reg ( .D(n1328), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_rf_overrun) );
  DFFRPQ_X1M_A9TH regs_lsr1_d_reg ( .D(regs_rf_overrun), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_lsr1_d) );
  DFFRPQ_X1M_A9TH regs_lsr1r_reg ( .D(regs_N150), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_lsr[1]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_bottom_reg_0_ ( .D(n1327), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_bottom[0]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_bottom_reg_1_ ( .D(n1324), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_bottom[1]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_bottom_reg_2_ ( .D(n1325), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_bottom[2]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_bottom_reg_3_ ( .D(n1326), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_bottom[3]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_top_reg_0_ ( .D(n1323), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_fifo_rx_top[0]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_top_reg_1_ ( .D(n1320), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_fifo_rx_top[1]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_top_reg_2_ ( .D(n1321), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_fifo_rx_top[2]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_top_reg_3_ ( .D(n1322), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_fifo_rx_top[3]) );
  DFFRPQ_X1M_A9TH regs_receiver_rf_data_in_reg_2_ ( .D(n1392), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rf_data_in[2]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_0__2_ ( .D(n1390), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[2]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_1__2_ ( .D(n1387), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[5]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_2__2_ ( .D(n1384), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[8]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_3__2_ ( .D(n1381), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[11]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_4__2_ ( .D(n1378), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[14]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_5__2_ ( .D(n1375), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[17]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_6__2_ ( .D(n1372), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[20]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_7__2_ ( .D(n1369), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[23]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_8__2_ ( .D(n1366), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[26]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_9__2_ ( .D(n1363), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[29]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_10__2_ ( .D(n1360), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[32]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_11__2_ ( .D(n1357), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[35]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_12__2_ ( .D(n1354), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[38]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_13__2_ ( .D(n1351), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[41]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_14__2_ ( .D(n1348), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[44]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_15__2_ ( .D(n1345), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[47]) );
  DFFRPQ_X1M_A9TH regs_lsr4_d_reg ( .D(regs_rf_data_out[2]), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_lsr4_d) );
  DFFRPQ_X1M_A9TH regs_lsr4r_reg ( .D(regs_N162), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_lsr[4]) );
  DFFRPQ_X1M_A9TH regs_receiver_rf_data_in_reg_0_ ( .D(n1394), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rf_data_in[0]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_0__0_ ( .D(n1391), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[0]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_1__0_ ( .D(n1388), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[3]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_2__0_ ( .D(n1385), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[6]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_3__0_ ( .D(n1382), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[9]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_4__0_ ( .D(n1379), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[12]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_5__0_ ( .D(n1376), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[15]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_6__0_ ( .D(n1373), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[18]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_7__0_ ( .D(n1370), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[21]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_8__0_ ( .D(n1367), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[24]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_9__0_ ( .D(n1364), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[27]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_10__0_ ( .D(n1361), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[30]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_11__0_ ( .D(n1358), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[33]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_12__0_ ( .D(n1355), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[36]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_13__0_ ( .D(n1352), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[39]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_14__0_ ( .D(n1349), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[42]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_15__0_ ( .D(n1346), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[45]) );
  DFFRPQ_X1M_A9TH regs_lsr3_d_reg ( .D(regs_rf_data_out[0]), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_lsr3_d) );
  DFFRPQ_X1M_A9TH regs_lsr3r_reg ( .D(regs_N158), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_lsr[3]) );
  DFFRPQ_X1M_A9TH regs_receiver_rf_data_in_reg_1_ ( .D(n1393), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rf_data_in[1]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_0__1_ ( .D(n1389), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[1]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_1__1_ ( .D(n1386), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[4]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_2__1_ ( .D(n1383), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[7]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_3__1_ ( .D(n1380), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[10]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_4__1_ ( .D(n1377), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[13]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_5__1_ ( .D(n1374), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[16]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_6__1_ ( .D(n1371), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[19]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_7__1_ ( .D(n1368), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[22]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_8__1_ ( .D(n1365), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[25]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_9__1_ ( .D(n1362), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[28]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_10__1_ ( .D(n1359), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[31]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_11__1_ ( .D(n1356), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[34]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_12__1_ ( .D(n1353), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[37]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_13__1_ ( .D(n1350), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[40]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_14__1_ ( .D(n1347), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[43]) );
  DFFRPQ_X1M_A9TH regs_receiver_fifo_rx_fifo_reg_15__1_ ( .D(n1344), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(regs_receiver_fifo_rx_fifo[46]) );
  DFFRPQ_X1M_A9TH regs_lsr7_d_reg ( .D(regs_lsr7), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_lsr7_d) );
  DFFRPQ_X1M_A9TH regs_lsr7r_reg ( .D(regs_N171), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_lsr[7]) );
  DFFRPQ_X1M_A9TH regs_lsr2_d_reg ( .D(regs_rf_data_out[1]), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_lsr2_d) );
  DFFRPQ_X1M_A9TH regs_lsr2r_reg ( .D(regs_N154), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_lsr[2]) );
  DFFRPQ_X1M_A9TH regs_rls_int_d_reg ( .D(regs_rls_int), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_rls_int_d) );
  DFFRPQ_X1M_A9TH regs_rls_int_pnd_reg ( .D(regs_N342), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_rls_int_pnd) );
  DFFRPQ_X1M_A9TH regs_iir_reg_2_ ( .D(regs_N398), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_iir[2]) );
  DFFRPQ_X1M_A9TH regs_iir_reg_3_ ( .D(regs_N399), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_iir[3]) );
  DFFRPQ_X1M_A9TH regs_thre_int_pnd_reg ( .D(regs_N358), .CK(wb_clk_i), .R(
        wb_rst_i), .Q(regs_thre_int_pnd) );
  DFFRPQ_X1M_A9TH regs_int_o_reg ( .D(regs_N383), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(int_o) );
  DFFRPQ_X1M_A9TH regs_iir_reg_1_ ( .D(regs_N397), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_iir[1]) );
  DFFRPQ_X1M_A9TH regs_receiver_rf_data_in_reg_3_ ( .D(n1319), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rf_data_in[3]) );
  DFFRPQ_X1M_A9TH regs_receiver_rf_data_in_reg_4_ ( .D(n1318), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rf_data_in[4]) );
  DFFRPQ_X1M_A9TH regs_receiver_rf_data_in_reg_5_ ( .D(n1317), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rf_data_in[5]) );
  DFFRPQ_X1M_A9TH regs_receiver_rf_data_in_reg_6_ ( .D(n1316), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rf_data_in[6]) );
  DFFRPQ_X1M_A9TH regs_receiver_rf_data_in_reg_7_ ( .D(n1315), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rf_data_in[7]) );
  DFFRPQ_X1M_A9TH regs_receiver_rf_data_in_reg_8_ ( .D(n1314), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rf_data_in[8]) );
  DFFRPQ_X1M_A9TH regs_receiver_rf_data_in_reg_9_ ( .D(n1313), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rf_data_in[9]) );
  DFFRPQ_X1M_A9TH regs_receiver_rf_data_in_reg_10_ ( .D(n1312), .CK(wb_clk_i), 
        .R(wb_rst_i), .Q(regs_receiver_rf_data_in[10]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_dat_o_reg_0_ ( .D(wb_dat8_o[0]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_dat_o[0]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_dat_o_reg_1_ ( .D(wb_dat8_o[1]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_dat_o[1]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_dat_o_reg_2_ ( .D(wb_dat8_o[2]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_dat_o[2]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_dat_o_reg_3_ ( .D(wb_dat8_o[3]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_dat_o[3]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_dat_o_reg_4_ ( .D(wb_dat8_o[4]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_dat_o[4]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_dat_o_reg_5_ ( .D(wb_dat8_o[5]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_dat_o[5]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_dat_o_reg_6_ ( .D(wb_dat8_o[6]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_dat_o[6]) );
  DFFRPQ_X1M_A9TH wb_interface_wb_dat_o_reg_7_ ( .D(wb_dat8_o[7]), .CK(
        wb_clk_i), .R(wb_rst_i), .Q(wb_dat_o[7]) );
  DFFSQ_X1M_A9TH wb_interface_wre_reg ( .D(wb_interface_N14), .CK(wb_clk_i), 
        .SN(n1020), .Q(wb_interface_wre) );
  DFFSQ_X1M_A9TH regs_msi_reset_reg ( .D(n1459), .CK(wb_clk_i), .SN(n1020), 
        .Q(regs_msi_reset) );
  DFFSQ_X1M_A9TH regs_lsr5_d_reg ( .D(regs_lsr5), .CK(wb_clk_i), .SN(n1020), 
        .Q(regs_lsr5_d) );
  DFFSQ_X1M_A9TH regs_lsr5r_reg ( .D(regs_N165), .CK(wb_clk_i), .SN(n1020), 
        .Q(regs_lsr[5]) );
  DFFSQ_X1M_A9TH regs_lsr6_d_reg ( .D(regs_lsr6), .CK(wb_clk_i), .SN(n1020), 
        .Q(regs_lsr6_d) );
  DFFSQ_X1M_A9TH regs_lsr6r_reg ( .D(regs_N167), .CK(wb_clk_i), .SN(n1020), 
        .Q(regs_lsr[6]) );
  DFFSQ_X1M_A9TH regs_i_uart_sync_flops_flop_0_reg_0_ ( .D(srx_pad_i), .CK(
        wb_clk_i), .SN(n1020), .Q(regs_i_uart_sync_flops_flop_0_0_) );
  DFFSQ_X1M_A9TH regs_i_uart_sync_flops_sync_dat_o_reg_0_ ( .D(
        regs_i_uart_sync_flops_flop_0_0_), .CK(wb_clk_i), .SN(n1020), .Q(
        regs_srx_pad) );
  DFFSQ_X1M_A9TH regs_transmitter_stx_o_tmp_reg ( .D(n1427), .CK(wb_clk_i), 
        .SN(n1020), .Q(regs_transmitter_stx_o_tmp) );
  DFFSQ_X1M_A9TH regs_receiver_counter_b_reg_1_ ( .D(n1426), .CK(wb_clk_i), 
        .SN(n1020), .Q(regs_receiver_counter_b[1]) );
  DFFSQ_X1M_A9TH regs_receiver_counter_b_reg_0_ ( .D(n1425), .CK(wb_clk_i), 
        .SN(n1020), .Q(regs_receiver_counter_b[0]) );
  DFFSQ_X1M_A9TH regs_receiver_counter_b_reg_2_ ( .D(n1424), .CK(wb_clk_i), 
        .SN(n1020), .Q(regs_receiver_counter_b[2]) );
  DFFSQ_X1M_A9TH regs_receiver_counter_b_reg_3_ ( .D(n1423), .CK(wb_clk_i), 
        .SN(n1020), .Q(regs_receiver_counter_b[3]) );
  DFFSQ_X1M_A9TH regs_receiver_counter_b_reg_4_ ( .D(n1422), .CK(wb_clk_i), 
        .SN(n1020), .Q(regs_receiver_counter_b[4]) );
  DFFSQ_X1M_A9TH regs_receiver_counter_b_reg_7_ ( .D(n1419), .CK(wb_clk_i), 
        .SN(n1020), .Q(regs_receiver_counter_b[7]) );
  DFFSQ_X1M_A9TH regs_receiver_counter_t_reg_1_ ( .D(n1338), .CK(wb_clk_i), 
        .SN(n1020), .Q(regs_counter_t[1]) );
  DFFSQ_X1M_A9TH regs_receiver_counter_t_reg_0_ ( .D(n1337), .CK(wb_clk_i), 
        .SN(n1020), .Q(regs_counter_t[0]) );
  DFFSQ_X1M_A9TH regs_receiver_counter_t_reg_2_ ( .D(n1336), .CK(wb_clk_i), 
        .SN(n1020), .Q(regs_counter_t[2]) );
  DFFSQ_X1M_A9TH regs_receiver_counter_t_reg_3_ ( .D(n1335), .CK(wb_clk_i), 
        .SN(n1020), .Q(regs_counter_t[3]) );
  DFFSQ_X1M_A9TH regs_receiver_counter_t_reg_4_ ( .D(n1334), .CK(wb_clk_i), 
        .SN(n1020), .Q(regs_counter_t[4]) );
  DFFSQ_X1M_A9TH regs_receiver_counter_t_reg_5_ ( .D(n1333), .CK(wb_clk_i), 
        .SN(n1020), .Q(regs_counter_t[5]) );
  DFFSQ_X1M_A9TH regs_receiver_counter_t_reg_6_ ( .D(n1332), .CK(wb_clk_i), 
        .SN(n1020), .Q(regs_counter_t[6]) );
  DFFSQ_X1M_A9TH regs_receiver_counter_t_reg_9_ ( .D(n1329), .CK(wb_clk_i), 
        .SN(n1020), .Q(regs_counter_t[9]) );
  DFFSQ_X1M_A9TH regs_iir_reg_0_ ( .D(regs_N396), .CK(wb_clk_i), .SN(n1020), 
        .Q(regs_iir[0]) );
  DFFRPQ_X1M_A9TH regs_scratch_reg_0_ ( .D(n1043), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_scratch[0]) );
  DFFRPQ_X1M_A9TH regs_scratch_reg_1_ ( .D(n1042), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_scratch[1]) );
  DFFRPQ_X1M_A9TH regs_scratch_reg_2_ ( .D(n1041), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_scratch[2]) );
  DFFRPQ_X1M_A9TH regs_scratch_reg_3_ ( .D(n1040), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_scratch[3]) );
  DFFRPQ_X1M_A9TH regs_scratch_reg_4_ ( .D(n1039), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_scratch[4]) );
  DFFRPQ_X1M_A9TH regs_scratch_reg_5_ ( .D(n1038), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_scratch[5]) );
  DFFRPQ_X1M_A9TH regs_scratch_reg_6_ ( .D(n1037), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_scratch[6]) );
  DFFRPQ_X1M_A9TH regs_scratch_reg_7_ ( .D(n1036), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_scratch[7]) );
  DFFRPQ_X1M_A9TH regs_mcr_reg_2_ ( .D(n1033), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_mcr[2]) );
  DFFRPQ_X1M_A9TH regs_mcr_reg_3_ ( .D(n1032), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_mcr[3]) );
  DFFRPQ_X1M_A9TH regs_lcr_reg_2_ ( .D(n1030), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_lcr[2]) );
  DFFRPQ_X1M_A9TH regs_lcr_reg_3_ ( .D(n1029), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_lcr[3]) );
  DFFRPQ_X1M_A9TH regs_lcr_reg_4_ ( .D(n1028), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_lcr[4]) );
  DFFRPQ_X1M_A9TH regs_lcr_reg_5_ ( .D(n1027), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_lcr[5]) );
  DFFRPQ_X1M_A9TH regs_lcr_reg_7_ ( .D(n1025), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_lcr[7]) );
  DFFSQ_X1M_A9TH regs_fcr_reg_0_ ( .D(n1024), .CK(wb_clk_i), .SN(n1020), .Q(
        regs_fcr[0]) );
  DFFSQ_X1M_A9TH regs_fcr_reg_1_ ( .D(n1023), .CK(wb_clk_i), .SN(n1020), .Q(
        regs_fcr[1]) );
  DFFSQ_X1M_A9TH regs_lcr_reg_0_ ( .D(n1022), .CK(wb_clk_i), .SN(n1020), .Q(
        regs_lcr[0]) );
  DFFSQ_X1M_A9TH regs_lcr_reg_1_ ( .D(n1021), .CK(wb_clk_i), .SN(n1020), .Q(
        regs_lcr[1]) );
  DFFRPQ_X1M_A9TH regs_mcr_reg_0_ ( .D(n1035), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(dtr_pad_o) );
  DFFRPQ_X1M_A9TH regs_mcr_reg_1_ ( .D(n1034), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(rts_pad_o) );
  DFFRPQ_X1M_A9TH regs_lcr_reg_6_ ( .D(n1026), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_lcr[6]) );
  DFFRPQ_X1M_A9TH regs_mcr_reg_4_ ( .D(n1031), .CK(wb_clk_i), .R(wb_rst_i), 
        .Q(regs_mcr[4]) );
  OR2_X1M_A9TH U1543 ( .A(n1573), .B(n1574), .Y(n1571) );
  OR2_X1M_A9TH U1544 ( .A(n1575), .B(n1576), .Y(n1573) );
  OR2_X1M_A9TH U1545 ( .A(n1577), .B(n1578), .Y(n1575) );
  NOR3_X2M_A9TH U1546 ( .A(regs_transmitter_fifo_tx_bottom[3]), .B(
        regs_transmitter_fifo_tx_bottom[1]), .C(
        regs_transmitter_fifo_tx_bottom[2]), .Y(n1932) );
  INV_X1B_A9TH U1549 ( .A(wb_adr_int[2]), .Y(n1707) );
  INV_X1B_A9TH U1550 ( .A(wb_adr_int[0]), .Y(n1706) );
  INV_X1B_A9TH U1551 ( .A(n2399), .Y(n2405) );
  INV_X1B_A9TH U1552 ( .A(regs_counter_t[3]), .Y(n2383) );
  INV_X1B_A9TH U1553 ( .A(n2410), .Y(n2414) );
  INV_X1B_A9TH U1554 ( .A(n1728), .Y(n1830) );
  INV_X1B_A9TH U1555 ( .A(n1729), .Y(n1826) );
  INV_X1B_A9TH U1556 ( .A(n1771), .Y(n1825) );
  INV_X1B_A9TH U1557 ( .A(regs_N124), .Y(n2026) );
  INV_X1B_A9TH U1558 ( .A(regs_lsr[2]), .Y(n1753) );
  INV_X1B_A9TH U1559 ( .A(regs_receiver_fifo_rx_fifo[10]), .Y(n2252) );
  INV_X1B_A9TH U1560 ( .A(regs_receiver_fifo_rx_fifo[7]), .Y(n2245) );
  INV_X1B_A9TH U1561 ( .A(regs_lsr[3]), .Y(n1772) );
  INV_X1B_A9TH U1562 ( .A(regs_receiver_fifo_rx_fifo[12]), .Y(n2256) );
  INV_X1B_A9TH U1563 ( .A(regs_lsr[4]), .Y(n1690) );
  INV_X1B_A9TH U1564 ( .A(regs_receiver_fifo_rx_fifo[11]), .Y(n2250) );
  INV_X1B_A9TH U1565 ( .A(regs_receiver_fifo_rx_fifo[8]), .Y(n2243) );
  INV_X1B_A9TH U1566 ( .A(regs_receiver_fifo_rx_bottom[1]), .Y(n2435) );
  INV_X1B_A9TH U1567 ( .A(n2402), .Y(n2415) );
  INV_X1B_A9TH U1568 ( .A(n2547), .Y(n2421) );
  INV_X1B_A9TH U1569 ( .A(regs_rf_count[2]), .Y(n2362) );
  INV_X1B_A9TH U1570 ( .A(regs_lcr[1]), .Y(n2614) );
  INV_X1B_A9TH U1571 ( .A(regs_receiver_rcounter16[3]), .Y(n2168) );
  INV_X1B_A9TH U1572 ( .A(n2161), .Y(n2165) );
  INV_X1B_A9TH U1574 ( .A(n1945), .Y(n1951) );
  INV_X1B_A9TH U1575 ( .A(regs_transmitter_fifo_tx_bottom[3]), .Y(n2456) );
  INV_X1B_A9TH U1576 ( .A(regs_transmitter_fifo_tx_bottom[2]), .Y(n2460) );
  INV_X1B_A9TH U1577 ( .A(regs_tf_count[2]), .Y(n2003) );
  INV_X1B_A9TH U1578 ( .A(regs_tf_count[1]), .Y(n2010) );
  INV_X1B_A9TH U1579 ( .A(n1965), .Y(n1984) );
  INV_X1B_A9TH U1580 ( .A(n2182), .Y(n2178) );
  INV_X1B_A9TH U1581 ( .A(n2061), .Y(n2062) );
  INV_X1B_A9TH U1582 ( .A(regs_block_cnt[5]), .Y(n2056) );
  INV_X1B_A9TH U1583 ( .A(n2038), .Y(n2042) );
  INV_X1B_A9TH U1584 ( .A(n2044), .Y(n2055) );
  INV_X1B_A9TH U1585 ( .A(n2049), .Y(n2066) );
  INV_X1B_A9TH U1586 ( .A(regs_lsr[5]), .Y(n2025) );
  INV_X1B_A9TH U1587 ( .A(regs_ier[2]), .Y(n1851) );
  INV_X1B_A9TH U1588 ( .A(regs_rf_count[1]), .Y(n2369) );
  INV_X1B_A9TH U1589 ( .A(n1827), .Y(n1773) );
  INV_X1B_A9TH U1590 ( .A(wb_adr_int[1]), .Y(n2585) );
  NAND4XXXB_X1M_A9TH U1591 ( .DN(regs_receiver_fifo_rx_fifo[3]), .A(n2228), 
        .B(n2236), .C(n2231), .Y(n1673) );
  NAND4XXXB_X1M_A9TH U1592 ( .DN(regs_receiver_counter_b[7]), .A(n2094), .B(
        n2093), .C(n2095), .Y(n2220) );
  INV_X1B_A9TH U1593 ( .A(n2372), .Y(n2422) );
  INV_X1B_A9TH U1594 ( .A(regs_rf_pop), .Y(n2420) );
  INV_X1B_A9TH U1595 ( .A(n2368), .Y(n2346) );
  INV_X1B_A9TH U1596 ( .A(n2366), .Y(n2359) );
  INV_X1B_A9TH U1597 ( .A(n2156), .Y(n2128) );
  INV_X1B_A9TH U1598 ( .A(n2143), .Y(n2177) );
  INV_X1B_A9TH U1599 ( .A(regs_receiver_counter_b[5]), .Y(n2093) );
  INV_X1B_A9TH U1600 ( .A(regs_tf_push), .Y(n1985) );
  INV_X1B_A9TH U1601 ( .A(regs_tx_reset), .Y(n2466) );
  INV_X1B_A9TH U1602 ( .A(n1631), .Y(n1839) );
  INV_X1B_A9TH U1603 ( .A(regs_dl[7]), .Y(n1618) );
  INV_X1B_A9TH U1604 ( .A(regs_dl[6]), .Y(n1619) );
  INV_X1B_A9TH U1605 ( .A(regs_dl[5]), .Y(n1620) );
  INV_X1B_A9TH U1606 ( .A(regs_dl[4]), .Y(n1621) );
  INV_X1B_A9TH U1607 ( .A(regs_dl[3]), .Y(n1622) );
  INV_X1B_A9TH U1608 ( .A(regs_dl[2]), .Y(n1623) );
  INV_X1B_A9TH U1609 ( .A(regs_dl[1]), .Y(n1624) );
  INV_X1B_A9TH U1610 ( .A(regs_dl[0]), .Y(n1717) );
  INV_X1B_A9TH U1611 ( .A(regs_lcr[6]), .Y(n2603) );
  INV_X1B_A9TH U1644 ( .A(n2607), .Y(n2610) );
  INV_X1B_A9TH U1645 ( .A(regs_lcr[7]), .Y(n2604) );
  INV_X1B_A9TH U1646 ( .A(regs_lcr[5]), .Y(n2601) );
  INV_X1B_A9TH U1647 ( .A(regs_lcr[2]), .Y(n2597) );
  INV_X1B_A9TH U1648 ( .A(n2616), .Y(n2613) );
  INV_X1B_A9TH U1649 ( .A(n2594), .Y(n2591) );
  INV_X1B_A9TH U1650 ( .A(n2584), .Y(n2583) );
  INV_X1B_A9TH U1651 ( .A(n2392), .Y(n2398) );
  INV_X1B_A9TH U1652 ( .A(regs_counter_t[0]), .Y(n2378) );
  INV_X1B_A9TH U1653 ( .A(n2387), .Y(n2397) );
  INV_X1B_A9TH U1654 ( .A(n2083), .Y(n2396) );
  INV_X1B_A9TH U1655 ( .A(n2079), .Y(n2077) );
  INV_X1B_A9TH U1656 ( .A(regs_receiver_counter_b[0]), .Y(n2074) );
  INV_X1B_A9TH U1657 ( .A(n2080), .Y(n2112) );
  INV_X1B_A9TH U1658 ( .A(n1848), .Y(n1761) );
  INV_X1B_A9TH U1659 ( .A(n2595), .Y(n1795) );
  INV_X1B_A9TH U1660 ( .A(regs_rls_int_pnd), .Y(n1649) );
  INV_X1B_A9TH U1661 ( .A(regs_receiver_fifo_rx_fifo[22]), .Y(n2280) );
  INV_X1B_A9TH U1662 ( .A(regs_receiver_fifo_rx_fifo[1]), .Y(n2231) );
  INV_X1B_A9TH U1663 ( .A(regs_receiver_fifo_rx_fifo[21]), .Y(n2277) );
  INV_X1B_A9TH U1664 ( .A(n2344), .Y(n2341) );
  INV_X1B_A9TH U1665 ( .A(n2333), .Y(n2331) );
  INV_X1B_A9TH U1666 ( .A(n2325), .Y(n2323) );
  INV_X1B_A9TH U1667 ( .A(n2317), .Y(n2315) );
  INV_X1B_A9TH U1668 ( .A(n2309), .Y(n2307) );
  INV_X1B_A9TH U1669 ( .A(n2302), .Y(n2300) );
  INV_X1B_A9TH U1670 ( .A(regs_receiver_fifo_rx_fifo[29]), .Y(n2292) );
  INV_X1B_A9TH U1671 ( .A(n2295), .Y(n2293) );
  INV_X1B_A9TH U1672 ( .A(n2288), .Y(n2286) );
  INV_X1B_A9TH U1673 ( .A(regs_receiver_fifo_rx_fifo[23]), .Y(n2278) );
  INV_X1B_A9TH U1674 ( .A(n2281), .Y(n2279) );
  INV_X1B_A9TH U1675 ( .A(n2274), .Y(n2272) );
  INV_X1B_A9TH U1676 ( .A(regs_receiver_fifo_rx_fifo[17]), .Y(n2264) );
  INV_X1B_A9TH U1677 ( .A(n2267), .Y(n2265) );
  INV_X1B_A9TH U1678 ( .A(n2260), .Y(n2258) );
  INV_X1B_A9TH U1679 ( .A(n2253), .Y(n2251) );
  INV_X1B_A9TH U1680 ( .A(n2246), .Y(n2244) );
  INV_X1B_A9TH U1681 ( .A(regs_receiver_fifo_rx_fifo[5]), .Y(n2236) );
  INV_X1B_A9TH U1682 ( .A(n2239), .Y(n2237) );
  INV_X1B_A9TH U1683 ( .A(regs_receiver_fifo_rx_fifo[2]), .Y(n2228) );
  INV_X1B_A9TH U1684 ( .A(n2232), .Y(n2230) );
  INV_X1B_A9TH U1685 ( .A(n2220), .Y(n2224) );
  INV_X1B_A9TH U1686 ( .A(regs_receiver_fifo_rx_top[3]), .Y(n2439) );
  INV_X1B_A9TH U1687 ( .A(regs_receiver_fifo_rx_top[2]), .Y(n2440) );
  INV_X1B_A9TH U1688 ( .A(regs_receiver_fifo_rx_top[1]), .Y(n2445) );
  INV_X1B_A9TH U1689 ( .A(regs_rx_reset), .Y(n2443) );
  INV_X1B_A9TH U1690 ( .A(regs_receiver_fifo_rx_top[0]), .Y(n2544) );
  INV_X1B_A9TH U1691 ( .A(n2438), .Y(n2447) );
  INV_X1B_A9TH U1692 ( .A(regs_receiver_fifo_rx_bottom[3]), .Y(n2426) );
  INV_X1B_A9TH U1693 ( .A(n2276), .Y(n2427) );
  INV_X1B_A9TH U1694 ( .A(regs_receiver_fifo_rx_bottom[2]), .Y(n2429) );
  INV_X1B_A9TH U1695 ( .A(regs_receiver_fifo_rx_bottom[0]), .Y(n2423) );
  INV_X1B_A9TH U1696 ( .A(regs_ti_int_pnd), .Y(n1648) );
  INV_X1B_A9TH U1697 ( .A(regs_counter_t[7]), .Y(n2406) );
  INV_X1B_A9TH U1698 ( .A(regs_rf_count[3]), .Y(n2352) );
  INV_X1B_A9TH U1699 ( .A(regs_rf_count[4]), .Y(n2350) );
  INV_X1B_A9TH U1700 ( .A(regs_rf_count[0]), .Y(n2367) );
  INV_X1B_A9TH U1701 ( .A(regs_receiver_rf_push), .Y(n2173) );
  INV_X1B_A9TH U1702 ( .A(regs_enable), .Y(n2215) );
  INV_X1B_A9TH U1703 ( .A(n2157), .Y(n2222) );
  INV_X1B_A9TH U1704 ( .A(regs_receiver_rshift[0]), .Y(n2201) );
  INV_X1B_A9TH U1705 ( .A(regs_receiver_rshift[1]), .Y(n2202) );
  INV_X1B_A9TH U1706 ( .A(regs_receiver_rshift[2]), .Y(n2199) );
  INV_X1B_A9TH U1707 ( .A(regs_receiver_rshift[3]), .Y(n2200) );
  INV_X1B_A9TH U1708 ( .A(regs_receiver_rshift[4]), .Y(n2197) );
  INV_X1B_A9TH U1709 ( .A(regs_receiver_rshift[5]), .Y(n2198) );
  INV_X1B_A9TH U1710 ( .A(regs_receiver_rshift[6]), .Y(n2203) );
  INV_X1B_A9TH U1711 ( .A(regs_receiver_rshift[7]), .Y(n2204) );
  INV_X1B_A9TH U1712 ( .A(n2187), .Y(n2193) );
  INV_X1B_A9TH U1713 ( .A(regs_receiver_rcounter16[1]), .Y(n2159) );
  INV_X1B_A9TH U1714 ( .A(regs_receiver_rbit_counter[1]), .Y(n2123) );
  INV_X1B_A9TH U1715 ( .A(regs_rstate[2]), .Y(n2147) );
  INV_X1B_A9TH U1716 ( .A(regs_rstate[0]), .Y(n2144) );
  INV_X1B_A9TH U1717 ( .A(regs_rstate[3]), .Y(n2221) );
  INV_X1B_A9TH U1718 ( .A(regs_rstate[1]), .Y(n2145) );
  INV_X1B_A9TH U1719 ( .A(n2130), .Y(n2137) );
  INV_X1B_A9TH U1720 ( .A(n2140), .Y(n2138) );
  INV_X1B_A9TH U1721 ( .A(regs_receiver_counter_b[6]), .Y(n2095) );
  INV_X1B_A9TH U1722 ( .A(n2194), .Y(n2179) );
  INV_X1B_A9TH U1723 ( .A(regs_transmitter_parity_xor), .Y(n1952) );
  INV_X1B_A9TH U1724 ( .A(regs_transmitter_fifo_tx_top[3]), .Y(n2472) );
  INV_X1B_A9TH U1725 ( .A(regs_transmitter_fifo_tx_top[2]), .Y(n2473) );
  INV_X1B_A9TH U1726 ( .A(regs_transmitter_fifo_tx_top[1]), .Y(n2476) );
  INV_X1B_A9TH U1727 ( .A(regs_transmitter_fifo_tx_top[0]), .Y(n2479) );
  INV_X1B_A9TH U1728 ( .A(regs_transmitter_counter[1]), .Y(n2530) );
  INV_X1B_A9TH U1729 ( .A(n2534), .Y(n2517) );
  INV_X1B_A9TH U1730 ( .A(regs_transmitter_counter[3]), .Y(n2527) );
  INV_X1B_A9TH U1731 ( .A(regs_transmitter_fifo_tx_bottom[1]), .Y(n2462) );
  INV_X1B_A9TH U1732 ( .A(regs_transmitter_fifo_tx_bottom[0]), .Y(n2455) );
  INV_X1B_A9TH U1733 ( .A(n2454), .Y(n2451) );
  INV_X1B_A9TH U1734 ( .A(n2000), .Y(n2009) );
  INV_X1B_A9TH U1735 ( .A(regs_tf_count[0]), .Y(n2008) );
  INV_X1B_A9TH U1736 ( .A(regs_transmitter_bit_counter[1]), .Y(n1968) );
  INV_X1B_A9TH U1737 ( .A(regs_transmitter_bit_counter[0]), .Y(n1964) );
  INV_X1B_A9TH U1738 ( .A(regs_lcr[0]), .Y(n2611) );
  INV_X1B_A9TH U1739 ( .A(regs_lcr[3]), .Y(n2599) );
  INV_X1B_A9TH U1740 ( .A(n1957), .Y(n1948) );
  INV_X1B_A9TH U1741 ( .A(n2019), .Y(n2013) );
  INV_X1B_A9TH U1742 ( .A(regs_tstate[2]), .Y(n2068) );
  INV_X1B_A9TH U1743 ( .A(n2521), .Y(n2537) );
  INV_X1B_A9TH U1744 ( .A(regs_transmitter_counter[0]), .Y(n2536) );
  INV_X1B_A9TH U1745 ( .A(regs_tstate[0]), .Y(n2021) );
  INV_X1B_A9TH U1746 ( .A(n1986), .Y(n2450) );
  INV_X1B_A9TH U1747 ( .A(n2022), .Y(n2024) );
  INV_X1B_A9TH U1748 ( .A(regs_block_cnt[4]), .Y(n2041) );
  INV_X1B_A9TH U1749 ( .A(regs_block_cnt[3]), .Y(n2035) );
  INV_X1B_A9TH U1750 ( .A(n2388), .Y(n2524) );
  INV_X1B_A9TH U1751 ( .A(n2036), .Y(n2039) );
  INV_X1B_A9TH U1752 ( .A(regs_block_cnt[0]), .Y(n2031) );
  INV_X1B_A9TH U1753 ( .A(regs_tf_count[4]), .Y(n2465) );
  INV_X1B_A9TH U1754 ( .A(regs_ier[3]), .Y(n1853) );
  INV_X1B_A9TH U1755 ( .A(regs_ier[1]), .Y(n1850) );
  INV_X1B_A9TH U1756 ( .A(regs_fcr[0]), .Y(n2605) );
  INV_X1B_A9TH U1757 ( .A(regs_fcr[1]), .Y(n2608) );
  INV_X1B_A9TH U1758 ( .A(regs_ier[0]), .Y(n1849) );
  INV_X1B_A9TH U1759 ( .A(n1854), .Y(n1852) );
  OR4_X1M_A9TH U1760 ( .A(n1543), .B(n1542), .C(n1541), .D(n1540), .Y(n1628)
         );
  INV_X1B_A9TH U1761 ( .A(regs_dl[8]), .Y(n1718) );
  INV_X1B_A9TH U1762 ( .A(regs_dl[12]), .Y(n1617) );
  INV_X1B_A9TH U1763 ( .A(regs_dl[13]), .Y(n1616) );
  INV_X1B_A9TH U1764 ( .A(regs_dl[14]), .Y(n1615) );
  INV_X1B_A9TH U1765 ( .A(wb_dat8_i[7]), .Y(n2609) );
  INV_X1B_A9TH U1766 ( .A(wb_dat8_i[6]), .Y(n2606) );
  INV_X1B_A9TH U1767 ( .A(wb_dat8_i[5]), .Y(n2602) );
  INV_X1B_A9TH U1768 ( .A(wb_dat8_i[4]), .Y(n2593) );
  INV_X1B_A9TH U1769 ( .A(wb_dat8_i[3]), .Y(n2600) );
  INV_X1B_A9TH U1770 ( .A(regs_N125), .Y(n1611) );
  INV_X1B_A9TH U1771 ( .A(wb_dat8_i[0]), .Y(n2612) );
  INV_X1B_A9TH U1772 ( .A(wb_dat8_i[2]), .Y(n2598) );
  INV_X1B_A9TH U1773 ( .A(wb_dat8_i[1]), .Y(n2615) );
  INV_X1B_A9TH U1774 ( .A(rts_pad_o), .Y(n2588) );
  INV_X1B_A9TH U1775 ( .A(dtr_pad_o), .Y(n2587) );
  INV_X1B_A9TH U1776 ( .A(regs_mcr[2]), .Y(n2589) );
  INV_X1B_A9TH U1777 ( .A(regs_mcr[4]), .Y(n2592) );
  INV_X1B_A9TH U1778 ( .A(regs_mcr[3]), .Y(n2590) );
  OR2_X1M_A9TH U1779 ( .A(n1571), .B(n1572), .Y(n1569) );
  INV_X1B_A9TH U1780 ( .A(regs_dl[11]), .Y(n1560) );
  INV_X1B_A9TH U1781 ( .A(regs_dl[10]), .Y(n1558) );
  OR2_X1M_A9TH U1782 ( .A(n1579), .B(n1580), .Y(n1577) );
  OR2_X1M_A9TH U1784 ( .A(n1581), .B(n1582), .Y(n1579) );
  OR2_X1M_A9TH U1785 ( .A(n1583), .B(n1584), .Y(n1581) );
  OR2_X1M_A9TH U1786 ( .A(n1587), .B(n1588), .Y(n1585) );
  OR2_X1M_A9TH U1787 ( .A(n1589), .B(n1590), .Y(n1587) );
  OR2_X1M_A9TH U1788 ( .A(n1591), .B(n1592), .Y(n1589) );
  OR2_X1M_A9TH U1789 ( .A(n1594), .B(n1593), .Y(n1591) );
  INV_X1B_A9TH U1790 ( .A(regs_counter_t[9]), .Y(n2412) );
  INV_X1B_A9TH U1791 ( .A(n2385), .Y(n2382) );
  INV_X1B_A9TH U1792 ( .A(n1644), .Y(regs_lsr5) );
  NAND4XXXB_X1M_A9TH U1793 ( .DN(n1743), .A(n1742), .B(n1741), .C(n1740), .Y(
        wb_dat8_o[1]) );
  NOR2XB_X1M_A9TH U1794 ( .BN(n1642), .A(n2419), .Y(regs_N342) );
  INV_X1B_A9TH U1795 ( .A(regs_rf_data_out[1]), .Y(n1693) );
  NAND4XXXB_X1M_A9TH U1796 ( .DN(regs_receiver_fifo_rx_fifo[9]), .A(n2250), 
        .B(n2256), .C(n2252), .Y(n1668) );
  INV_X1B_A9TH U1797 ( .A(regs_rf_data_out[0]), .Y(n1692) );
  INV_X1B_A9TH U1798 ( .A(regs_rf_data_out[2]), .Y(n1691) );
  INV_X1B_A9TH U1799 ( .A(n2432), .Y(n2436) );
  INV_X1B_A9TH U1800 ( .A(regs_lsr[1]), .Y(n1695) );
  INV_X1B_A9TH U1801 ( .A(n1636), .Y(regs_ti_int) );
  INV_X1B_A9TH U1802 ( .A(n2365), .Y(n2363) );
  INV_X1B_A9TH U1803 ( .A(n2176), .Y(n2124) );
  INV_X1B_A9TH U1804 ( .A(n2167), .Y(n2169) );
  INV_X1B_A9TH U1805 ( .A(n1538), .Y(n1445) );
  INV_X1B_A9TH U1806 ( .A(n2453), .Y(n2458) );
  INV_X1B_A9TH U1807 ( .A(n2006), .Y(n2004) );
  INV_X1B_A9TH U1808 ( .A(regs_transmitter_bit_counter[2]), .Y(n1944) );
  INV_X1B_A9TH U1809 ( .A(regs_block_cnt[7]), .Y(n2064) );
  INV_X1B_A9TH U1810 ( .A(n2058), .Y(n2052) );
  INV_X1B_A9TH U1811 ( .A(n1633), .Y(regs_lsr_mask_condition) );
  INV_X1B_A9TH U1816 ( .A(n1594), .Y(regs_N208) );
  OR2_X1M_A9TH U1817 ( .A(n1569), .B(n1570), .Y(n1567) );
  OR2_X1M_A9TH U1818 ( .A(n1585), .B(n1586), .Y(n1583) );
  NAND2_X1M_A9TH U1820 ( .A(n1847), .B(wb_interface_wre), .Y(n1487) );
  NAND2_X1M_A9TH U1822 ( .A(n1707), .B(n2585), .Y(n1539) );
  NAND2_X1M_A9TH U1824 ( .A(n1595), .B(n1706), .Y(n1729) );
  INV_X1M_A9TH U1826 ( .A(wb_rst_i), .Y(n1020) );
  NOR3_X1M_A9TH U1827 ( .A(n1707), .B(n1706), .C(wb_adr_int[1]), .Y(n1827) );
  AND2_X1M_A9TH U1829 ( .A(n1632), .B(n2604), .Y(n1656) );
  NAND2_X1M_A9TH U1830 ( .A(n1827), .B(n1656), .Y(n1633) );
  NAND2_X1M_A9TH U1831 ( .A(regs_transmitter_stx_o_tmp), .B(n2603), .Y(n1488)
         );
  NAND2_X1M_A9TH U1832 ( .A(n2592), .B(n1488), .Y(stx_pad_o) );
  NOR2_X1M_A9TH U1833 ( .A(regs_lsr[2]), .B(regs_lsr[1]), .Y(n1489) );
  AOI31_X1M_A9TH U1834 ( .A0(n1489), .A1(n1690), .A2(n1772), .B0(n1851), .Y(
        regs_rls_int) );
  NOR3_X1M_A9TH U1835 ( .A(regs_rf_count[3]), .B(regs_rf_count[1]), .C(
        regs_rf_count[2]), .Y(n2417) );
  AND2_X1M_A9TH U1836 ( .A(n2417), .B(n2350), .Y(n1697) );
  NAND2_X1M_A9TH U1837 ( .A(n2367), .B(n1697), .Y(n2372) );
  NOR3_X1M_A9TH U1838 ( .A(regs_counter_t[0]), .B(regs_counter_t[2]), .C(
        regs_counter_t[1]), .Y(n2381) );
  NAND3B_X1M_A9TH U1839 ( .AN(regs_counter_t[4]), .B(n2381), .C(n2383), .Y(
        n2393) );
  NOR3_X1M_A9TH U1840 ( .A(regs_counter_t[6]), .B(regs_counter_t[5]), .C(n2393), .Y(n2392) );
  NAND2_X1M_A9TH U1841 ( .A(n2392), .B(n2406), .Y(n2400) );
  NOR3_X1M_A9TH U1842 ( .A(regs_counter_t[9]), .B(regs_counter_t[8]), .C(n2400), .Y(n2374) );
  NAND3_X1M_A9TH U1843 ( .A(n2372), .B(n2374), .C(regs_ier[0]), .Y(n1636) );
  NOR3_X1M_A9TH U1844 ( .A(regs_block_cnt[2]), .B(regs_block_cnt[0]), .C(
        regs_block_cnt[1]), .Y(n2036) );
  NAND2XB_X1M_A9TH U1846 ( .BN(n2043), .A(n2056), .Y(n2045) );
  NOR3_X1M_A9TH U1847 ( .A(regs_block_cnt[7]), .B(regs_block_cnt[6]), .C(n2045), .Y(n2028) );
  NOR3_X1M_A9TH U1849 ( .A(n1996), .B(regs_tf_count[4]), .C(regs_tf_count[3]), 
        .Y(n1986) );
  NAND2_X1M_A9TH U1850 ( .A(n2028), .B(n1986), .Y(n1644) );
  NAND2_X1M_A9TH U1851 ( .A(n2426), .B(n2429), .Y(n1491) );
  NAND2_X1M_A9TH U1852 ( .A(n2423), .B(n2435), .Y(n1493) );
  NOR2_X1A_A9TH U1853 ( .A(n1491), .B(n1493), .Y(n2226) );
  NAND2_X1M_A9TH U1854 ( .A(n2426), .B(regs_receiver_fifo_rx_bottom[2]), .Y(
        n1490) );
  NOR2_X1A_A9TH U1855 ( .A(n1490), .B(n1493), .Y(n2255) );
  AOI22_X1M_A9TH U1856 ( .A0(n2226), .A1(regs_receiver_fifo_rx_fifo[1]), .B0(
        n2255), .B1(regs_receiver_fifo_rx_fifo[13]), .Y(n1504) );
  NAND2_X1M_A9TH U1857 ( .A(regs_receiver_fifo_rx_bottom[1]), .B(n2423), .Y(
        n1494) );
  NOR2_X1A_A9TH U1858 ( .A(n1494), .B(n1491), .Y(n2241) );
  NOR2_X1A_A9TH U1859 ( .A(n1490), .B(n1494), .Y(n2269) );
  AOI22_X1M_A9TH U1860 ( .A0(n2241), .A1(regs_receiver_fifo_rx_fifo[7]), .B0(
        n2269), .B1(regs_receiver_fifo_rx_fifo[19]), .Y(n1503) );
  NAND2_X1M_A9TH U1861 ( .A(regs_receiver_fifo_rx_bottom[0]), .B(n2435), .Y(
        n2434) );
  NOR2_X1A_A9TH U1862 ( .A(n1490), .B(n2434), .Y(n2262) );
  NAND2_X1M_A9TH U1863 ( .A(regs_receiver_fifo_rx_bottom[0]), .B(
        regs_receiver_fifo_rx_bottom[1]), .Y(n2428) );
  NOR2_X1A_A9TH U1865 ( .A(n2428), .B(n1491), .Y(n2248) );
  NOR2_X1A_A9TH U1866 ( .A(n1491), .B(n2434), .Y(n2234) );
  AOI22_X1M_A9TH U1867 ( .A0(n2248), .A1(regs_receiver_fifo_rx_fifo[10]), .B0(
        n2234), .B1(regs_receiver_fifo_rx_fifo[4]), .Y(n1492) );
  OAI21_X1M_A9TH U1868 ( .A0(n2427), .A1(n2280), .B0(n1492), .Y(n1501) );
  NAND2_X1M_A9TH U1869 ( .A(regs_receiver_fifo_rx_bottom[3]), .B(n2429), .Y(
        n2425) );
  NOR2_X1A_A9TH U1870 ( .A(n2425), .B(n1493), .Y(n2283) );
  NAND2_X1M_A9TH U1871 ( .A(regs_receiver_fifo_rx_bottom[3]), .B(
        regs_receiver_fifo_rx_bottom[2]), .Y(n1495) );
  NOR2_X1A_A9TH U1872 ( .A(n1493), .B(n1495), .Y(n2312) );
  AOI22_X1M_A9TH U1873 ( .A0(n2283), .A1(regs_receiver_fifo_rx_fifo[25]), .B0(
        n2312), .B1(regs_receiver_fifo_rx_fifo[37]), .Y(n1499) );
  NOR2_X1A_A9TH U1874 ( .A(n2425), .B(n1494), .Y(n2297) );
  NOR2_X1A_A9TH U1875 ( .A(n1494), .B(n1495), .Y(n2328) );
  AOI22_X1M_A9TH U1876 ( .A0(n2297), .A1(regs_receiver_fifo_rx_fifo[31]), .B0(
        n2328), .B1(regs_receiver_fifo_rx_fifo[43]), .Y(n1498) );
  NOR2_X1A_A9TH U1877 ( .A(n2425), .B(n2434), .Y(n2290) );
  NOR2_X1A_A9TH U1878 ( .A(n1495), .B(n2434), .Y(n2320) );
  AOI22_X1M_A9TH U1879 ( .A0(n2290), .A1(regs_receiver_fifo_rx_fifo[28]), .B0(
        n2320), .B1(regs_receiver_fifo_rx_fifo[40]), .Y(n1497) );
  NOR2_X1A_A9TH U1880 ( .A(n2428), .B(n2425), .Y(n2304) );
  NOR2_X1A_A9TH U1881 ( .A(n2428), .B(n1495), .Y(n2336) );
  AOI22_X1M_A9TH U1882 ( .A0(n2304), .A1(regs_receiver_fifo_rx_fifo[34]), .B0(
        n2336), .B1(regs_receiver_fifo_rx_fifo[46]), .Y(n1496) );
  NAND4_X1A_A9TH U1883 ( .A(n1499), .B(n1498), .C(n1497), .D(n1496), .Y(n1500)
         );
  AOI211_X1M_A9TH U1884 ( .A0(n2262), .A1(regs_receiver_fifo_rx_fifo[16]), 
        .B0(n1501), .C0(n1500), .Y(n1502) );
  AOI22_X1M_A9TH U1886 ( .A0(n2226), .A1(regs_receiver_fifo_rx_fifo[0]), .B0(
        n2255), .B1(regs_receiver_fifo_rx_fifo[12]), .Y(n1514) );
  AOI22_X1M_A9TH U1887 ( .A0(n2241), .A1(regs_receiver_fifo_rx_fifo[6]), .B0(
        n2269), .B1(regs_receiver_fifo_rx_fifo[18]), .Y(n1513) );
  AOI22_X1M_A9TH U1888 ( .A0(n2248), .A1(regs_receiver_fifo_rx_fifo[9]), .B0(
        n2234), .B1(regs_receiver_fifo_rx_fifo[3]), .Y(n1505) );
  OAI21_X1M_A9TH U1889 ( .A0(n2427), .A1(n2277), .B0(n1505), .Y(n1511) );
  AOI22_X1M_A9TH U1890 ( .A0(n2283), .A1(regs_receiver_fifo_rx_fifo[24]), .B0(
        n2312), .B1(regs_receiver_fifo_rx_fifo[36]), .Y(n1509) );
  AOI22_X1M_A9TH U1891 ( .A0(n2297), .A1(regs_receiver_fifo_rx_fifo[30]), .B0(
        n2328), .B1(regs_receiver_fifo_rx_fifo[42]), .Y(n1508) );
  AOI22_X1M_A9TH U1892 ( .A0(n2290), .A1(regs_receiver_fifo_rx_fifo[27]), .B0(
        n2320), .B1(regs_receiver_fifo_rx_fifo[39]), .Y(n1507) );
  AOI22_X1M_A9TH U1893 ( .A0(n2304), .A1(regs_receiver_fifo_rx_fifo[33]), .B0(
        n2336), .B1(regs_receiver_fifo_rx_fifo[45]), .Y(n1506) );
  NAND4_X1A_A9TH U1894 ( .A(n1509), .B(n1508), .C(n1507), .D(n1506), .Y(n1510)
         );
  AOI211_X1M_A9TH U1895 ( .A0(n2262), .A1(regs_receiver_fifo_rx_fifo[15]), 
        .B0(n1511), .C0(n1510), .Y(n1512) );
  AOI22_X1M_A9TH U1897 ( .A0(n2226), .A1(regs_receiver_fifo_rx_fifo[2]), .B0(
        n2255), .B1(regs_receiver_fifo_rx_fifo[14]), .Y(n1524) );
  AOI22_X1M_A9TH U1898 ( .A0(n2241), .A1(regs_receiver_fifo_rx_fifo[8]), .B0(
        n2269), .B1(regs_receiver_fifo_rx_fifo[20]), .Y(n1523) );
  AOI22_X1M_A9TH U1899 ( .A0(n2248), .A1(regs_receiver_fifo_rx_fifo[11]), .B0(
        n2234), .B1(regs_receiver_fifo_rx_fifo[5]), .Y(n1515) );
  OAI21_X1M_A9TH U1900 ( .A0(n2427), .A1(n2278), .B0(n1515), .Y(n1521) );
  AOI22_X1M_A9TH U1901 ( .A0(n2283), .A1(regs_receiver_fifo_rx_fifo[26]), .B0(
        n2312), .B1(regs_receiver_fifo_rx_fifo[38]), .Y(n1519) );
  AOI22_X1M_A9TH U1902 ( .A0(n2297), .A1(regs_receiver_fifo_rx_fifo[32]), .B0(
        n2328), .B1(regs_receiver_fifo_rx_fifo[44]), .Y(n1518) );
  AOI22_X1M_A9TH U1903 ( .A0(n2290), .A1(regs_receiver_fifo_rx_fifo[29]), .B0(
        n2320), .B1(regs_receiver_fifo_rx_fifo[41]), .Y(n1517) );
  AOI22_X1M_A9TH U1904 ( .A0(n2304), .A1(regs_receiver_fifo_rx_fifo[35]), .B0(
        n2336), .B1(regs_receiver_fifo_rx_fifo[47]), .Y(n1516) );
  NAND4_X1A_A9TH U1905 ( .A(n1519), .B(n1518), .C(n1517), .D(n1516), .Y(n1520)
         );
  AOI211_X1M_A9TH U1906 ( .A0(n2262), .A1(regs_receiver_fifo_rx_fifo[17]), 
        .B0(n1521), .C0(n1520), .Y(n1522) );
  NAND2_X1M_A9TH U1908 ( .A(regs_transmitter_fifo_tx_bottom[1]), .B(
        regs_transmitter_fifo_tx_bottom[2]), .Y(n1526) );
  NOR2_X1A_A9TH U1909 ( .A(regs_transmitter_fifo_tx_bottom[3]), .B(n1526), .Y(
        n2453) );
  NAND2_X1M_A9TH U1910 ( .A(regs_transmitter_fifo_tx_bottom[3]), .B(n2460), 
        .Y(n2457) );
  NOR2_X1A_A9TH U1911 ( .A(regs_transmitter_fifo_tx_bottom[1]), .B(n2457), .Y(
        n1928) );
  AOI22_X1M_A9TH U1912 ( .A0(regs_transmitter_fifo_tx_tfifo_ram[61]), .A1(
        n2453), .B0(regs_transmitter_fifo_tx_tfifo_ram[77]), .B1(n1928), .Y(
        n1537) );
  NAND2_X1M_A9TH U1913 ( .A(regs_transmitter_fifo_tx_bottom[2]), .B(n2462), 
        .Y(n1525) );
  NOR2_X1A_A9TH U1914 ( .A(regs_transmitter_fifo_tx_bottom[3]), .B(n1525), .Y(
        n1927) );
  NAND2_X1M_A9TH U1915 ( .A(regs_transmitter_fifo_tx_bottom[1]), .B(n2460), 
        .Y(n2459) );
  AOI22_X1M_A9TH U1917 ( .A0(regs_transmitter_fifo_tx_tfifo_ram[45]), .A1(
        n1927), .B0(regs_transmitter_fifo_tx_tfifo_ram[29]), .B1(n1926), .Y(
        n1536) );
  NOR2_X1A_A9TH U1918 ( .A(n2456), .B(n1525), .Y(n1930) );
  AOI22_X1M_A9TH U1920 ( .A0(regs_transmitter_fifo_tx_tfifo_ram[109]), .A1(
        n1930), .B0(regs_transmitter_fifo_tx_tfifo_ram[93]), .B1(n1929), .Y(
        n1528) );
  NOR2_X1A_A9TH U1921 ( .A(n2456), .B(n1526), .Y(n1931) );
  AOI22_X1M_A9TH U1922 ( .A0(regs_transmitter_fifo_tx_tfifo_ram[13]), .A1(
        n1932), .B0(regs_transmitter_fifo_tx_tfifo_ram[125]), .B1(n1931), .Y(
        n1527) );
  AND3_X1M_A9TH U1923 ( .A(n1528), .B(regs_transmitter_fifo_tx_bottom[0]), .C(
        n1527), .Y(n1535) );
  AND2_X1M_A9TH U1924 ( .A(n1926), .B(regs_transmitter_fifo_tx_tfifo_ram[21]), 
        .Y(n1533) );
  AOI22_X1M_A9TH U1925 ( .A0(n2453), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[53]), .B0(n1928), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[69]), .Y(n1531) );
  AOI22_X1M_A9TH U1926 ( .A0(n1930), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[101]), .B0(n1929), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[85]), .Y(n1530) );
  AOI22_X1M_A9TH U1927 ( .A0(n1932), .A1(regs_transmitter_fifo_tx_tfifo_ram[5]), .B0(n1931), .B1(regs_transmitter_fifo_tx_tfifo_ram[117]), .Y(n1529) );
  NAND4_X1A_A9TH U1928 ( .A(n1531), .B(n1530), .C(n1529), .D(n2455), .Y(n1532)
         );
  AOI211_X1M_A9TH U1929 ( .A0(regs_transmitter_fifo_tx_tfifo_ram[37]), .A1(
        n1927), .B0(n1533), .C0(n1532), .Y(n1534) );
  AOI31_X1M_A9TH U1930 ( .A0(n1537), .A1(n1536), .A2(n1535), .B0(n1534), .Y(
        n1881) );
  NAND2_X1M_A9TH U1932 ( .A(regs_tstate[2]), .B(n1946), .Y(n2020) );
  NAND3_X1M_A9TH U1934 ( .A(n2068), .B(n2021), .C(regs_tstate[1]), .Y(n1957)
         );
  NOR3_X1M_A9TH U1936 ( .A(regs_transmitter_counter[4]), .B(
        regs_transmitter_counter[3]), .C(n2520), .Y(n2522) );
  NAND3_X1M_A9TH U1937 ( .A(regs_enable), .B(regs_transmitter_counter[0]), .C(
        n2522), .Y(n1945) );
  NOR3_X1M_A9TH U1938 ( .A(regs_transmitter_bit_counter[2]), .B(
        regs_transmitter_bit_counter[1]), .C(regs_transmitter_bit_counter[0]), 
        .Y(n2019) );
  AOI31_X1M_A9TH U1939 ( .A0(n1948), .A1(n1951), .A2(n2013), .B0(n1965), .Y(
        n1979) );
  NOR2_X1A_A9TH U1940 ( .A(n1979), .B(n1957), .Y(n1978) );
  AOI222_X1M_A9TH U1941 ( .A0(n1881), .A1(n1965), .B0(n1979), .B1(
        regs_transmitter_shift_out[4]), .C0(n1978), .C1(
        regs_transmitter_shift_out[5]), .Y(n1538) );
  NOR2_X1A_A9TH U1942 ( .A(regs_lcr[7]), .B(n1539), .Y(n1708) );
  NAND2_X1M_A9TH U1943 ( .A(n1708), .B(n1706), .Y(n1631) );
  NOR2_X1A_A9TH U1944 ( .A(n2596), .B(n1631), .Y(regs_N124) );
  OR4_X1M_A9TH U1945 ( .A(regs_dlc[14]), .B(regs_dlc[15]), .C(regs_dlc[12]), 
        .D(regs_dlc[13]), .Y(n1543) );
  OR4_X1M_A9TH U1946 ( .A(regs_dlc[10]), .B(regs_dlc[11]), .C(regs_dlc[8]), 
        .D(regs_dlc[9]), .Y(n1542) );
  OR4_X1M_A9TH U1947 ( .A(regs_dlc[6]), .B(regs_dlc[7]), .C(regs_dlc[4]), .D(
        regs_dlc[5]), .Y(n1541) );
  OR4_X1M_A9TH U1948 ( .A(regs_dlc[2]), .B(regs_dlc[3]), .C(regs_dlc[0]), .D(
        regs_dlc[1]), .Y(n1540) );
  INV_X1B_A9TH U1949 ( .A(regs_dl[15]), .Y(n1614) );
  NAND2_X1M_A9TH U1950 ( .A(n1564), .B(regs_dlc[15]), .Y(n1545) );
  NAND2_X1M_A9TH U1952 ( .A(n1564), .B(regs_dlc[0]), .Y(n1546) );
  OAI21_X1M_A9TH U1953 ( .A0(n1564), .A1(n1717), .B0(n1546), .Y(n1594) );
  NAND2_X1M_A9TH U1954 ( .A(n1564), .B(regs_dlc[1]), .Y(n1547) );
  OAI21_X1M_A9TH U1955 ( .A0(n1564), .A1(n1624), .B0(n1547), .Y(n1593) );
  NAND2_X1M_A9TH U1956 ( .A(n1564), .B(regs_dlc[2]), .Y(n1548) );
  OAI21_X1M_A9TH U1957 ( .A0(n1564), .A1(n1623), .B0(n1548), .Y(n1592) );
  NAND2_X1M_A9TH U1958 ( .A(n1564), .B(regs_dlc[3]), .Y(n1549) );
  OAI21_X1M_A9TH U1959 ( .A0(n1564), .A1(n1622), .B0(n1549), .Y(n1590) );
  NAND2_X1M_A9TH U1960 ( .A(n1564), .B(regs_dlc[4]), .Y(n1550) );
  OAI21_X1M_A9TH U1961 ( .A0(n1564), .A1(n1621), .B0(n1550), .Y(n1588) );
  NAND2_X1M_A9TH U1962 ( .A(n1564), .B(regs_dlc[5]), .Y(n1551) );
  OAI21_X1M_A9TH U1963 ( .A0(n1564), .A1(n1620), .B0(n1551), .Y(n1586) );
  NAND2_X1M_A9TH U1964 ( .A(n1564), .B(regs_dlc[6]), .Y(n1552) );
  OAI21_X1M_A9TH U1965 ( .A0(n1564), .A1(n1619), .B0(n1552), .Y(n1584) );
  NAND2_X1M_A9TH U1966 ( .A(n1564), .B(regs_dlc[7]), .Y(n1553) );
  OAI21_X1M_A9TH U1967 ( .A0(n1564), .A1(n1618), .B0(n1553), .Y(n1582) );
  NAND2_X1M_A9TH U1968 ( .A(n1564), .B(regs_dlc[8]), .Y(n1554) );
  OAI21_X1M_A9TH U1969 ( .A0(n1564), .A1(n1718), .B0(n1554), .Y(n1580) );
  NAND2_X1M_A9TH U1970 ( .A(n1564), .B(regs_dlc[9]), .Y(n1555) );
  OAI21_X1M_A9TH U1971 ( .A0(n1564), .A1(n2625), .B0(n1555), .Y(n1578) );
  NAND2_X1M_A9TH U1972 ( .A(n1564), .B(regs_dlc[10]), .Y(n1557) );
  OAI21_X1M_A9TH U1973 ( .A0(n1564), .A1(n1558), .B0(n1557), .Y(n1576) );
  NAND2_X1M_A9TH U1974 ( .A(n1564), .B(regs_dlc[11]), .Y(n1559) );
  OAI21_X1M_A9TH U1975 ( .A0(n1564), .A1(n1560), .B0(n1559), .Y(n1574) );
  NAND2_X1M_A9TH U1976 ( .A(n1564), .B(regs_dlc[12]), .Y(n1561) );
  OAI21_X1M_A9TH U1977 ( .A0(n1564), .A1(n1617), .B0(n1561), .Y(n1572) );
  NAND2_X1M_A9TH U1978 ( .A(n1564), .B(regs_dlc[13]), .Y(n1562) );
  OAI21_X1M_A9TH U1979 ( .A0(n1564), .A1(n1616), .B0(n1562), .Y(n1570) );
  NAND2_X1M_A9TH U1980 ( .A(n1564), .B(regs_dlc[14]), .Y(n1563) );
  OAI21_X1M_A9TH U1981 ( .A0(n1564), .A1(n1615), .B0(n1563), .Y(n1568) );
  XNOR2_X1M_A9TH U1984 ( .A(n1568), .B(n1567), .Y(regs_N222) );
  XNOR2_X1M_A9TH U1985 ( .A(n1570), .B(n1569), .Y(regs_N221) );
  XNOR2_X1M_A9TH U1986 ( .A(n1572), .B(n1571), .Y(regs_N220) );
  XNOR2_X1M_A9TH U1987 ( .A(n1574), .B(n1573), .Y(regs_N219) );
  XNOR2_X1M_A9TH U1988 ( .A(n1576), .B(n1575), .Y(regs_N218) );
  XNOR2_X1M_A9TH U1989 ( .A(n1578), .B(n1577), .Y(regs_N217) );
  XNOR2_X1M_A9TH U1990 ( .A(n1580), .B(n1579), .Y(regs_N216) );
  XNOR2_X1M_A9TH U1991 ( .A(n1582), .B(n1581), .Y(regs_N215) );
  XNOR2_X1M_A9TH U1992 ( .A(n1584), .B(n1583), .Y(regs_N214) );
  XNOR2_X1M_A9TH U1993 ( .A(n1586), .B(n1585), .Y(regs_N213) );
  XNOR2_X1M_A9TH U1994 ( .A(n1588), .B(n1587), .Y(regs_N212) );
  XNOR2_X1M_A9TH U1995 ( .A(n1590), .B(n1589), .Y(regs_N211) );
  XNOR2_X1M_A9TH U1996 ( .A(n1592), .B(n1591), .Y(regs_N210) );
  XNOR2_X1M_A9TH U1997 ( .A(n1593), .B(n1594), .Y(regs_N209) );
  NAND2_X1M_A9TH U1998 ( .A(wb_adr_int[0]), .B(n1595), .Y(n1728) );
  OR2_X1M_A9TH U1999 ( .A(n2596), .B(n1728), .Y(n1613) );
  NAND2_X1M_A9TH U2000 ( .A(n1613), .B(regs_dl[9]), .Y(n1596) );
  OAI21_X1M_A9TH U2001 ( .A0(n1613), .A1(n2615), .B0(n1596), .Y(n1470) );
  NAND2_X1M_A9TH U2002 ( .A(n1613), .B(regs_dl[10]), .Y(n1597) );
  OAI21_X1M_A9TH U2003 ( .A0(n1613), .A1(n2598), .B0(n1597), .Y(n1469) );
  NAND2_X1M_A9TH U2004 ( .A(n1613), .B(regs_dl[11]), .Y(n1598) );
  OAI21_X1M_A9TH U2005 ( .A0(n1613), .A1(n2600), .B0(n1598), .Y(n1468) );
  NAND2_X1M_A9TH U2006 ( .A(n1613), .B(regs_dl[12]), .Y(n1599) );
  OAI21_X1M_A9TH U2007 ( .A0(n1613), .A1(n2593), .B0(n1599), .Y(n1467) );
  NAND2_X1M_A9TH U2008 ( .A(n1613), .B(regs_dl[13]), .Y(n1600) );
  OAI21_X1M_A9TH U2009 ( .A0(n1613), .A1(n2602), .B0(n1600), .Y(n1466) );
  NAND2_X1M_A9TH U2010 ( .A(n1613), .B(regs_dl[14]), .Y(n1601) );
  OAI21_X1M_A9TH U2011 ( .A0(n1613), .A1(n2606), .B0(n1601), .Y(n1465) );
  NAND2_X1M_A9TH U2012 ( .A(n1613), .B(regs_dl[15]), .Y(n1602) );
  OAI21_X1M_A9TH U2013 ( .A0(n1613), .A1(n2609), .B0(n1602), .Y(n1464) );
  NAND2_X1M_A9TH U2014 ( .A(n1611), .B(regs_dl[4]), .Y(n1603) );
  OAI21_X1M_A9TH U2015 ( .A0(n2593), .A1(n1611), .B0(n1603), .Y(n1475) );
  NAND2_X1M_A9TH U2016 ( .A(n1611), .B(regs_dl[5]), .Y(n1604) );
  OAI21_X1M_A9TH U2017 ( .A0(n2602), .A1(n1611), .B0(n1604), .Y(n1474) );
  NAND2_X1M_A9TH U2018 ( .A(n1611), .B(regs_dl[6]), .Y(n1605) );
  OAI21_X1M_A9TH U2019 ( .A0(n2606), .A1(n1611), .B0(n1605), .Y(n1473) );
  NAND2_X1M_A9TH U2020 ( .A(n1611), .B(regs_dl[7]), .Y(n1606) );
  OAI21_X1M_A9TH U2021 ( .A0(n2609), .A1(n1611), .B0(n1606), .Y(n1472) );
  NAND2_X1M_A9TH U2022 ( .A(n1611), .B(regs_dl[0]), .Y(n1607) );
  OAI21_X1M_A9TH U2023 ( .A0(n1611), .A1(n2612), .B0(n1607), .Y(n1479) );
  NAND2_X1M_A9TH U2024 ( .A(n1611), .B(regs_dl[1]), .Y(n1608) );
  OAI21_X1M_A9TH U2025 ( .A0(n2615), .A1(n1611), .B0(n1608), .Y(n1478) );
  NAND2_X1M_A9TH U2026 ( .A(n1611), .B(regs_dl[2]), .Y(n1609) );
  OAI21_X1M_A9TH U2027 ( .A0(n2598), .A1(n1611), .B0(n1609), .Y(n1477) );
  NAND2_X1M_A9TH U2028 ( .A(n1611), .B(regs_dl[3]), .Y(n1610) );
  OAI21_X1M_A9TH U2029 ( .A0(n2600), .A1(n1611), .B0(n1610), .Y(n1476) );
  NAND2_X1M_A9TH U2030 ( .A(n1613), .B(regs_dl[8]), .Y(n1612) );
  OAI21_X1M_A9TH U2031 ( .A0(n1613), .A1(n2612), .B0(n1612), .Y(n1471) );
  NOR3_X1M_A9TH U2032 ( .A(regs_dl[9]), .B(regs_dl[10]), .C(regs_dl[11]), .Y(
        n1630) );
  NAND4_X1A_A9TH U2033 ( .A(n1617), .B(n1616), .C(n1615), .D(n1614), .Y(n1627)
         );
  NAND4_X1A_A9TH U2034 ( .A(n1621), .B(n1620), .C(n1619), .D(n1618), .Y(n1626)
         );
  NAND4_X1A_A9TH U2035 ( .A(n1717), .B(n1624), .C(n1623), .D(n1622), .Y(n1625)
         );
  NOR3_X1M_A9TH U2036 ( .A(n1627), .B(n1626), .C(n1625), .Y(n1629) );
  AOI31_X1M_A9TH U2037 ( .A0(n1630), .A1(n1629), .A2(n1718), .B0(n1628), .Y(
        regs_N224) );
  NAND2_X1M_A9TH U2038 ( .A(n1839), .B(n1632), .Y(n1856) );
  AOI21_X1M_A9TH U2039 ( .A0(regs_ti_int_pnd), .A1(n1856), .B0(
        regs_rda_int_pnd), .Y(n1635) );
  NAND3_X1M_A9TH U2040 ( .A(n1706), .B(wb_adr_int[2]), .C(wb_adr_int[1]), .Y(
        n1771) );
  AOI32_X1M_A9TH U2042 ( .A0(regs_ms_int_pnd), .A1(n1648), .A2(n1855), .B0(
        regs_thre_int_pnd), .B1(n1648), .Y(n1634) );
  AOI32_X1M_A9TH U2044 ( .A0(n1635), .A1(n1649), .A2(n1634), .B0(
        regs_rls_int_pnd), .B1(n2419), .Y(regs_N383) );
  OAI22_X1M_A9TH U2045 ( .A0(regs_ti_int_d), .A1(n1636), .B0(n1849), .B1(n1648), .Y(n1637) );
  AND2_X1M_A9TH U2046 ( .A(n1856), .B(n1637), .Y(regs_N370) );
  NOR2_X1M_A9TH U2047 ( .A(regs_msr[0]), .B(regs_msr[1]), .Y(n1638) );
  INV_X1B_A9TH U2048 ( .A(regs_msr[2]), .Y(n1752) );
  INV_X1B_A9TH U2049 ( .A(regs_msr[3]), .Y(n1770) );
  AOI31_X1M_A9TH U2050 ( .A0(n1638), .A1(n1752), .A2(n1770), .B0(n1853), .Y(
        regs_ms_int) );
  INV_X1B_A9TH U2051 ( .A(regs_ms_int_d), .Y(n1639) );
  INV_X1B_A9TH U2054 ( .A(regs_rls_int), .Y(n1641) );
  OAI22_X1M_A9TH U2055 ( .A0(regs_rls_int_d), .A1(n1641), .B0(n1649), .B1(
        n1851), .Y(n1642) );
  AOI22_X1M_A9TH U2056 ( .A0(regs_mcr[4]), .A1(n2590), .B0(n1485), .B1(n2592), 
        .Y(regs_dcd_c) );
  AOI22_X1M_A9TH U2057 ( .A0(regs_mcr[4]), .A1(n2589), .B0(n1484), .B1(n2592), 
        .Y(regs_ri_c) );
  AOI22_X1M_A9TH U2058 ( .A0(regs_mcr[4]), .A1(n2587), .B0(n1483), .B1(n2592), 
        .Y(regs_dsr_c) );
  AOI22_X1M_A9TH U2059 ( .A0(regs_mcr[4]), .A1(n2588), .B0(n1482), .B1(n2592), 
        .Y(regs_cts_c) );
  NOR3_X1M_A9TH U2060 ( .A(wb_adr_int[0]), .B(wb_adr_int[2]), .C(n2585), .Y(
        n1828) );
  NOR2_X1A_A9TH U2063 ( .A(n2615), .B(n2607), .Y(regs_N116) );
  NOR2_X1A_A9TH U2064 ( .A(regs_tstate[0]), .B(regs_tstate[1]), .Y(n2534) );
  AND2_X1M_A9TH U2066 ( .A(n2017), .B(regs_lsr5), .Y(regs_lsr6) );
  AOI2XB1_X1M_A9TH U2067 ( .A1N(regs_lsr6_d), .A0(regs_lsr6), .B0(regs_lsr[6]), 
        .Y(n1643) );
  AOI221_X1M_A9TH U2069 ( .A0(regs_lsr5_d), .A1(n2025), .B0(n1644), .B1(n2025), 
        .C0(regs_N124), .Y(regs_N165) );
  OAI21_X1M_A9TH U2070 ( .A0(n2352), .A1(regs_fcr[1]), .B0(n2350), .Y(n1657)
         );
  NOR2_X1A_A9TH U2071 ( .A(regs_fcr[0]), .B(n2362), .Y(n1658) );
  NOR3_X1M_A9TH U2072 ( .A(regs_rf_count[0]), .B(regs_fcr[1]), .C(regs_fcr[0]), 
        .Y(n1660) );
  NOR2_X1M_A9TH U2073 ( .A(regs_rf_count[2]), .B(n2605), .Y(n1645) );
  NAND2_X1M_A9TH U2074 ( .A(regs_fcr[1]), .B(regs_fcr[0]), .Y(n1659) );
  AOI211_X1M_A9TH U2076 ( .A0(n1660), .A1(n2369), .B0(n1645), .C0(n1661), .Y(
        n1646) );
  OAI22_X1M_A9TH U2077 ( .A0(n1658), .A1(n1646), .B0(regs_rf_count[3]), .B1(
        n2608), .Y(n1647) );
  AOI2XB1_X1M_A9TH U2078 ( .A1N(n1657), .A0(n1647), .B0(n1849), .Y(
        regs_rda_int) );
  NAND2_X1M_A9TH U2080 ( .A(n1651), .B(n1648), .Y(regs_N398) );
  NOR3_X1M_A9TH U2081 ( .A(regs_thre_int_pnd), .B(regs_ms_int_pnd), .C(
        regs_N398), .Y(regs_N396) );
  NAND2_X1M_A9TH U2082 ( .A(regs_thre_int_pnd), .B(n1648), .Y(n1650) );
  OAI21_X1M_A9TH U2083 ( .A0(n1650), .A1(regs_rda_int), .B0(n1649), .Y(
        regs_N397) );
  AND2_X1M_A9TH U2084 ( .A(n1651), .B(regs_ti_int_pnd), .Y(regs_N399) );
  NAND2_X1M_A9TH U2085 ( .A(n1828), .B(regs_iir[1]), .Y(n1726) );
  NOR3_X1M_A9TH U2086 ( .A(regs_iir[2]), .B(regs_iir[3]), .C(n1726), .Y(n1655)
         );
  INV_X1B_A9TH U2087 ( .A(regs_iir[0]), .Y(n1654) );
  NOR2_X1M_A9TH U2088 ( .A(regs_thre_int_d), .B(n2025), .Y(n1652) );
  OAI211_X1M_A9TH U2089 ( .A0(regs_thre_int_pnd), .A1(n1652), .B0(regs_ier[1]), 
        .C0(n2026), .Y(n1653) );
  AOI31_X1M_A9TH U2090 ( .A0(n1656), .A1(n1655), .A2(n1654), .B0(n1653), .Y(
        regs_N358) );
  NOR2_X1A_A9TH U2091 ( .A(n2025), .B(n1850), .Y(regs_thre_int) );
  AOI211_X1M_A9TH U2092 ( .A0(regs_rf_count[1]), .A1(n1659), .B0(n1658), .C0(
        n1657), .Y(n1667) );
  AOI221_X1M_A9TH U2093 ( .A0(regs_rf_count[0]), .A1(regs_fcr[0]), .B0(n2362), 
        .B1(regs_fcr[0]), .C0(n1660), .Y(n1666) );
  NAND2_X1M_A9TH U2094 ( .A(regs_rf_count[3]), .B(n2367), .Y(n1662) );
  AOI211_X1M_A9TH U2095 ( .A0(regs_fcr[1]), .A1(n1662), .B0(n1661), .C0(n1856), 
        .Y(n1665) );
  INV_X1B_A9TH U2096 ( .A(regs_rda_int_d), .Y(n1663) );
  AOI22_X1M_A9TH U2097 ( .A0(regs_ier[0]), .A1(regs_rda_int_pnd), .B0(
        regs_rda_int), .B1(n1663), .Y(n1664) );
  AOI31_X1M_A9TH U2098 ( .A0(n1667), .A1(n1666), .A2(n1665), .B0(n1664), .Y(
        regs_N351) );
  NOR3_X1M_A9TH U2099 ( .A(regs_receiver_fifo_rx_fifo[14]), .B(
        regs_receiver_fifo_rx_fifo[13]), .C(n1668), .Y(n1688) );
  NOR3_X1M_A9TH U2100 ( .A(regs_receiver_fifo_rx_fifo[20]), .B(
        regs_receiver_fifo_rx_fifo[21]), .C(regs_receiver_fifo_rx_fifo[19]), 
        .Y(n1670) );
  NOR3_X1M_A9TH U2101 ( .A(regs_receiver_fifo_rx_fifo[18]), .B(
        regs_receiver_fifo_rx_fifo[15]), .C(regs_receiver_fifo_rx_fifo[16]), 
        .Y(n1669) );
  NAND4_X1A_A9TH U2102 ( .A(n2264), .B(n1670), .C(n1669), .D(n2278), .Y(n1686)
         );
  NOR3_X1M_A9TH U2103 ( .A(regs_receiver_fifo_rx_fifo[30]), .B(
        regs_receiver_fifo_rx_fifo[27]), .C(regs_receiver_fifo_rx_fifo[28]), 
        .Y(n1672) );
  NOR3_X1M_A9TH U2104 ( .A(regs_receiver_fifo_rx_fifo[26]), .B(
        regs_receiver_fifo_rx_fifo[24]), .C(regs_receiver_fifo_rx_fifo[25]), 
        .Y(n1671) );
  NAND4_X1A_A9TH U2105 ( .A(n2292), .B(n1672), .C(n1671), .D(n2280), .Y(n1685)
         );
  NOR3_X1M_A9TH U2106 ( .A(regs_receiver_fifo_rx_fifo[0]), .B(
        regs_receiver_fifo_rx_fifo[46]), .C(regs_rf_overrun), .Y(n1683) );
  NOR3_X1M_A9TH U2107 ( .A(regs_receiver_fifo_rx_fifo[6]), .B(
        regs_receiver_fifo_rx_fifo[4]), .C(n1673), .Y(n1682) );
  NOR3_X1M_A9TH U2108 ( .A(regs_receiver_fifo_rx_fifo[35]), .B(
        regs_receiver_fifo_rx_fifo[33]), .C(regs_receiver_fifo_rx_fifo[31]), 
        .Y(n1675) );
  NOR3_X1M_A9TH U2109 ( .A(regs_receiver_fifo_rx_fifo[36]), .B(
        regs_receiver_fifo_rx_fifo[37]), .C(regs_receiver_fifo_rx_fifo[34]), 
        .Y(n1674) );
  NAND2_X1M_A9TH U2110 ( .A(n1675), .B(n1674), .Y(n1676) );
  NOR3_X1M_A9TH U2111 ( .A(regs_receiver_fifo_rx_fifo[32]), .B(
        regs_receiver_fifo_rx_fifo[38]), .C(n1676), .Y(n1681) );
  NOR3_X1M_A9TH U2112 ( .A(regs_receiver_fifo_rx_fifo[42]), .B(
        regs_receiver_fifo_rx_fifo[39]), .C(regs_receiver_fifo_rx_fifo[40]), 
        .Y(n1678) );
  NOR3_X1M_A9TH U2113 ( .A(regs_receiver_fifo_rx_fifo[47]), .B(
        regs_receiver_fifo_rx_fifo[45]), .C(regs_receiver_fifo_rx_fifo[43]), 
        .Y(n1677) );
  NAND2_X1M_A9TH U2114 ( .A(n1678), .B(n1677), .Y(n1679) );
  NOR3_X1M_A9TH U2115 ( .A(regs_receiver_fifo_rx_fifo[44]), .B(
        regs_receiver_fifo_rx_fifo[41]), .C(n1679), .Y(n1680) );
  NAND4_X1A_A9TH U2116 ( .A(n1683), .B(n1682), .C(n1681), .D(n1680), .Y(n1684)
         );
  NOR3_X1M_A9TH U2117 ( .A(n1686), .B(n1685), .C(n1684), .Y(n1687) );
  NAND4_X1A_A9TH U2118 ( .A(n2243), .B(n1688), .C(n1687), .D(n2245), .Y(
        regs_lsr7) );
  AOI2XB1_X1M_A9TH U2119 ( .A1N(regs_lsr7_d), .A0(regs_lsr7), .B0(regs_lsr[7]), 
        .Y(n1689) );
  NOR2_X1A_A9TH U2120 ( .A(n2419), .B(n1689), .Y(regs_N171) );
  AOI221_X1M_A9TH U2121 ( .A0(n1691), .A1(n1690), .B0(regs_lsr4_d), .B1(n1690), 
        .C0(n2419), .Y(regs_N162) );
  AOI221_X1M_A9TH U2122 ( .A0(n1692), .A1(n1772), .B0(regs_lsr3_d), .B1(n1772), 
        .C0(n2419), .Y(regs_N158) );
  AOI221_X1M_A9TH U2123 ( .A0(n1693), .A1(n1753), .B0(regs_lsr2_d), .B1(n1753), 
        .C0(n2419), .Y(regs_N154) );
  INV_X1B_A9TH U2124 ( .A(regs_rf_overrun), .Y(n1694) );
  AOI221_X1M_A9TH U2125 ( .A0(regs_lsr1_d), .A1(n1695), .B0(n1694), .B1(n1695), 
        .C0(n2419), .Y(regs_N150) );
  NOR2_X1A_A9TH U2126 ( .A(regs_receiver_rf_push_q), .B(n2173), .Y(n2547) );
  NOR2_X1A_A9TH U2128 ( .A(n2420), .B(n2547), .Y(n2368) );
  NOR2_X1A_A9TH U2129 ( .A(n2367), .B(n2346), .Y(n2361) );
  AOI2XB1_X1M_A9TH U2130 ( .A1N(regs_lsr0_d), .A0(regs_lsr0), .B0(regs_lsr[0]), 
        .Y(n1696) );
  AOI211_X1M_A9TH U2131 ( .A0(n1697), .A1(n2361), .B0(regs_rx_reset), .C0(
        n1696), .Y(regs_N146) );
  NOR2_X1A_A9TH U2134 ( .A(regs_msi_reset), .B(n1699), .Y(regs_N139) );
  NOR2_X1A_A9TH U2137 ( .A(regs_msi_reset), .B(n1701), .Y(regs_N140) );
  NOR2_X1A_A9TH U2140 ( .A(regs_msi_reset), .B(n1703), .Y(regs_N141) );
  NOR2_X1A_A9TH U2143 ( .A(regs_msi_reset), .B(n1705), .Y(regs_N142) );
  AOI22_X1M_A9TH U2144 ( .A0(n1827), .A1(regs_lsr[0]), .B0(n1825), .B1(
        regs_msr[0]), .Y(n1725) );
  NOR3_X1M_A9TH U2145 ( .A(n1706), .B(n1707), .C(n2585), .Y(n2582) );
  AOI22_X1M_A9TH U2146 ( .A0(n2582), .A1(regs_scratch[0]), .B0(n1828), .B1(
        regs_iir[0]), .Y(n1724) );
  NAND2_X1M_A9TH U2148 ( .A(wb_adr_int[0]), .B(n1708), .Y(n1848) );
  AOI22_X1M_A9TH U2149 ( .A0(regs_lcr[0]), .A1(n1795), .B0(regs_ier[0]), .B1(
        n1761), .Y(n1723) );
  AOI22_X1M_A9TH U2150 ( .A0(n2276), .A1(regs_receiver_fifo_rx_rfifo_ram[56]), 
        .B0(n2234), .B1(regs_receiver_fifo_rx_rfifo_ram[8]), .Y(n1712) );
  AOI22_X1M_A9TH U2151 ( .A0(n2262), .A1(regs_receiver_fifo_rx_rfifo_ram[40]), 
        .B0(n2248), .B1(regs_receiver_fifo_rx_rfifo_ram[24]), .Y(n1711) );
  AOI22_X1M_A9TH U2152 ( .A0(n2290), .A1(regs_receiver_fifo_rx_rfifo_ram[72]), 
        .B0(n2320), .B1(regs_receiver_fifo_rx_rfifo_ram[104]), .Y(n1710) );
  AOI22_X1M_A9TH U2153 ( .A0(n2304), .A1(regs_receiver_fifo_rx_rfifo_ram[88]), 
        .B0(n2336), .B1(regs_receiver_fifo_rx_rfifo_ram[120]), .Y(n1709) );
  NAND4_X1A_A9TH U2154 ( .A(n1712), .B(n1711), .C(n1710), .D(n1709), .Y(n1721)
         );
  AOI22_X1M_A9TH U2155 ( .A0(n2226), .A1(regs_receiver_fifo_rx_rfifo_ram[0]), 
        .B0(n2255), .B1(regs_receiver_fifo_rx_rfifo_ram[32]), .Y(n1716) );
  AOI22_X1M_A9TH U2156 ( .A0(n2241), .A1(regs_receiver_fifo_rx_rfifo_ram[16]), 
        .B0(n2269), .B1(regs_receiver_fifo_rx_rfifo_ram[48]), .Y(n1715) );
  AOI22_X1M_A9TH U2157 ( .A0(n2283), .A1(regs_receiver_fifo_rx_rfifo_ram[64]), 
        .B0(n2312), .B1(regs_receiver_fifo_rx_rfifo_ram[96]), .Y(n1714) );
  AOI22_X1M_A9TH U2158 ( .A0(n2297), .A1(regs_receiver_fifo_rx_rfifo_ram[80]), 
        .B0(n2328), .B1(regs_receiver_fifo_rx_rfifo_ram[112]), .Y(n1713) );
  NAND4_X1A_A9TH U2159 ( .A(n1716), .B(n1715), .C(n1714), .D(n1713), .Y(n1720)
         );
  OAI22_X1M_A9TH U2160 ( .A0(n1728), .A1(n1718), .B0(n1729), .B1(n1717), .Y(
        n1719) );
  AOI221_X1M_A9TH U2161 ( .A0(n1721), .A1(n1839), .B0(n1720), .B1(n1839), .C0(
        n1719), .Y(n1722) );
  NAND4_X1A_A9TH U2162 ( .A(n1725), .B(n1724), .C(n1723), .D(n1722), .Y(
        wb_dat8_o[0]) );
  AOI22_X1M_A9TH U2163 ( .A0(n1761), .A1(regs_ier[1]), .B0(n2582), .B1(
        regs_scratch[1]), .Y(n1727) );
  OAI211_X1M_A9TH U2164 ( .A0(n2595), .A1(n2614), .B0(n1727), .C0(n1726), .Y(
        n1743) );
  AOI22_X1M_A9TH U2165 ( .A0(n1827), .A1(regs_lsr[1]), .B0(n1825), .B1(
        regs_msr[1]), .Y(n1742) );
  AOI22_X1M_A9TH U2166 ( .A0(n1830), .A1(regs_dl[9]), .B0(n1826), .B1(
        regs_dl[1]), .Y(n1741) );
  AOI22_X1M_A9TH U2167 ( .A0(n2276), .A1(regs_receiver_fifo_rx_rfifo_ram[57]), 
        .B0(n2234), .B1(regs_receiver_fifo_rx_rfifo_ram[9]), .Y(n1733) );
  AOI22_X1M_A9TH U2168 ( .A0(n2262), .A1(regs_receiver_fifo_rx_rfifo_ram[41]), 
        .B0(n2248), .B1(regs_receiver_fifo_rx_rfifo_ram[25]), .Y(n1732) );
  AOI22_X1M_A9TH U2169 ( .A0(n2290), .A1(regs_receiver_fifo_rx_rfifo_ram[73]), 
        .B0(n2320), .B1(regs_receiver_fifo_rx_rfifo_ram[105]), .Y(n1731) );
  AOI22_X1M_A9TH U2170 ( .A0(n2304), .A1(regs_receiver_fifo_rx_rfifo_ram[89]), 
        .B0(n2336), .B1(regs_receiver_fifo_rx_rfifo_ram[121]), .Y(n1730) );
  NAND4_X1A_A9TH U2171 ( .A(n1733), .B(n1732), .C(n1731), .D(n1730), .Y(n1739)
         );
  AOI22_X1M_A9TH U2172 ( .A0(n2226), .A1(regs_receiver_fifo_rx_rfifo_ram[1]), 
        .B0(n2255), .B1(regs_receiver_fifo_rx_rfifo_ram[33]), .Y(n1737) );
  AOI22_X1M_A9TH U2173 ( .A0(n2241), .A1(regs_receiver_fifo_rx_rfifo_ram[17]), 
        .B0(n2269), .B1(regs_receiver_fifo_rx_rfifo_ram[49]), .Y(n1736) );
  AOI22_X1M_A9TH U2174 ( .A0(n2283), .A1(regs_receiver_fifo_rx_rfifo_ram[65]), 
        .B0(n2312), .B1(regs_receiver_fifo_rx_rfifo_ram[97]), .Y(n1735) );
  AOI22_X1M_A9TH U2175 ( .A0(n2297), .A1(regs_receiver_fifo_rx_rfifo_ram[81]), 
        .B0(n2328), .B1(regs_receiver_fifo_rx_rfifo_ram[113]), .Y(n1734) );
  NAND4_X1A_A9TH U2176 ( .A(n1737), .B(n1736), .C(n1735), .D(n1734), .Y(n1738)
         );
  OAI21_X1M_A9TH U2177 ( .A0(n1739), .A1(n1738), .B0(n1839), .Y(n1740) );
  AOI22_X1M_A9TH U2178 ( .A0(n1830), .A1(regs_dl[10]), .B0(n1826), .B1(
        regs_dl[2]), .Y(n1760) );
  AOI22_X1M_A9TH U2179 ( .A0(n2582), .A1(regs_scratch[2]), .B0(n1828), .B1(
        regs_iir[2]), .Y(n1759) );
  AOI22_X1M_A9TH U2180 ( .A0(regs_lcr[2]), .A1(n1795), .B0(n1761), .B1(
        regs_ier[2]), .Y(n1758) );
  AOI22_X1M_A9TH U2181 ( .A0(n2276), .A1(regs_receiver_fifo_rx_rfifo_ram[58]), 
        .B0(n2234), .B1(regs_receiver_fifo_rx_rfifo_ram[10]), .Y(n1747) );
  AOI22_X1M_A9TH U2182 ( .A0(n2262), .A1(regs_receiver_fifo_rx_rfifo_ram[42]), 
        .B0(n2248), .B1(regs_receiver_fifo_rx_rfifo_ram[26]), .Y(n1746) );
  AOI22_X1M_A9TH U2183 ( .A0(n2290), .A1(regs_receiver_fifo_rx_rfifo_ram[74]), 
        .B0(n2320), .B1(regs_receiver_fifo_rx_rfifo_ram[106]), .Y(n1745) );
  AOI22_X1M_A9TH U2184 ( .A0(n2304), .A1(regs_receiver_fifo_rx_rfifo_ram[90]), 
        .B0(n2336), .B1(regs_receiver_fifo_rx_rfifo_ram[122]), .Y(n1744) );
  NAND4_X1A_A9TH U2185 ( .A(n1747), .B(n1746), .C(n1745), .D(n1744), .Y(n1756)
         );
  AOI22_X1M_A9TH U2186 ( .A0(n2226), .A1(regs_receiver_fifo_rx_rfifo_ram[2]), 
        .B0(n2255), .B1(regs_receiver_fifo_rx_rfifo_ram[34]), .Y(n1751) );
  AOI22_X1M_A9TH U2187 ( .A0(n2241), .A1(regs_receiver_fifo_rx_rfifo_ram[18]), 
        .B0(n2269), .B1(regs_receiver_fifo_rx_rfifo_ram[50]), .Y(n1750) );
  AOI22_X1M_A9TH U2188 ( .A0(n2283), .A1(regs_receiver_fifo_rx_rfifo_ram[66]), 
        .B0(n2312), .B1(regs_receiver_fifo_rx_rfifo_ram[98]), .Y(n1749) );
  AOI22_X1M_A9TH U2189 ( .A0(n2297), .A1(regs_receiver_fifo_rx_rfifo_ram[82]), 
        .B0(n2328), .B1(regs_receiver_fifo_rx_rfifo_ram[114]), .Y(n1748) );
  NAND4_X1A_A9TH U2190 ( .A(n1751), .B(n1750), .C(n1749), .D(n1748), .Y(n1755)
         );
  OAI22_X1M_A9TH U2191 ( .A0(n1773), .A1(n1753), .B0(n1771), .B1(n1752), .Y(
        n1754) );
  AOI221_X1M_A9TH U2192 ( .A0(n1756), .A1(n1839), .B0(n1755), .B1(n1839), .C0(
        n1754), .Y(n1757) );
  NAND4_X1A_A9TH U2193 ( .A(n1760), .B(n1759), .C(n1758), .D(n1757), .Y(
        wb_dat8_o[2]) );
  AOI22_X1M_A9TH U2194 ( .A0(n1830), .A1(regs_dl[11]), .B0(n1826), .B1(
        regs_dl[3]), .Y(n1780) );
  AOI22_X1M_A9TH U2195 ( .A0(n2582), .A1(regs_scratch[3]), .B0(n1828), .B1(
        regs_iir[3]), .Y(n1779) );
  AOI22_X1M_A9TH U2196 ( .A0(regs_lcr[3]), .A1(n1795), .B0(n1761), .B1(
        regs_ier[3]), .Y(n1778) );
  AOI22_X1M_A9TH U2197 ( .A0(n2276), .A1(regs_receiver_fifo_rx_rfifo_ram[59]), 
        .B0(n2234), .B1(regs_receiver_fifo_rx_rfifo_ram[11]), .Y(n1765) );
  AOI22_X1M_A9TH U2198 ( .A0(n2262), .A1(regs_receiver_fifo_rx_rfifo_ram[43]), 
        .B0(n2248), .B1(regs_receiver_fifo_rx_rfifo_ram[27]), .Y(n1764) );
  AOI22_X1M_A9TH U2199 ( .A0(n2290), .A1(regs_receiver_fifo_rx_rfifo_ram[75]), 
        .B0(n2320), .B1(regs_receiver_fifo_rx_rfifo_ram[107]), .Y(n1763) );
  AOI22_X1M_A9TH U2200 ( .A0(n2304), .A1(regs_receiver_fifo_rx_rfifo_ram[91]), 
        .B0(n2336), .B1(regs_receiver_fifo_rx_rfifo_ram[123]), .Y(n1762) );
  NAND4_X1A_A9TH U2201 ( .A(n1765), .B(n1764), .C(n1763), .D(n1762), .Y(n1776)
         );
  AOI22_X1M_A9TH U2202 ( .A0(n2226), .A1(regs_receiver_fifo_rx_rfifo_ram[3]), 
        .B0(n2255), .B1(regs_receiver_fifo_rx_rfifo_ram[35]), .Y(n1769) );
  AOI22_X1M_A9TH U2203 ( .A0(n2241), .A1(regs_receiver_fifo_rx_rfifo_ram[19]), 
        .B0(n2269), .B1(regs_receiver_fifo_rx_rfifo_ram[51]), .Y(n1768) );
  AOI22_X1M_A9TH U2204 ( .A0(n2283), .A1(regs_receiver_fifo_rx_rfifo_ram[67]), 
        .B0(n2312), .B1(regs_receiver_fifo_rx_rfifo_ram[99]), .Y(n1767) );
  AOI22_X1M_A9TH U2205 ( .A0(n2297), .A1(regs_receiver_fifo_rx_rfifo_ram[83]), 
        .B0(n2328), .B1(regs_receiver_fifo_rx_rfifo_ram[115]), .Y(n1766) );
  NAND4_X1A_A9TH U2206 ( .A(n1769), .B(n1768), .C(n1767), .D(n1766), .Y(n1775)
         );
  OAI22_X1M_A9TH U2207 ( .A0(n1773), .A1(n1772), .B0(n1771), .B1(n1770), .Y(
        n1774) );
  AOI221_X1M_A9TH U2208 ( .A0(n1776), .A1(n1839), .B0(n1775), .B1(n1839), .C0(
        n1774), .Y(n1777) );
  NAND4_X1A_A9TH U2209 ( .A(n1780), .B(n1779), .C(n1778), .D(n1777), .Y(
        wb_dat8_o[3]) );
  AOI22_X1M_A9TH U2210 ( .A0(regs_lcr[4]), .A1(n1795), .B0(n2582), .B1(
        regs_scratch[4]), .Y(n1794) );
  AOI22_X1M_A9TH U2211 ( .A0(n1827), .A1(regs_lsr[4]), .B0(n1825), .B1(
        regs_msr[4]), .Y(n1793) );
  AOI22_X1M_A9TH U2212 ( .A0(n1830), .A1(regs_dl[12]), .B0(n1826), .B1(
        regs_dl[4]), .Y(n1792) );
  AOI22_X1M_A9TH U2213 ( .A0(n2276), .A1(regs_receiver_fifo_rx_rfifo_ram[60]), 
        .B0(n2234), .B1(regs_receiver_fifo_rx_rfifo_ram[12]), .Y(n1784) );
  AOI22_X1M_A9TH U2214 ( .A0(n2262), .A1(regs_receiver_fifo_rx_rfifo_ram[44]), 
        .B0(n2248), .B1(regs_receiver_fifo_rx_rfifo_ram[28]), .Y(n1783) );
  AOI22_X1M_A9TH U2215 ( .A0(n2290), .A1(regs_receiver_fifo_rx_rfifo_ram[76]), 
        .B0(n2320), .B1(regs_receiver_fifo_rx_rfifo_ram[108]), .Y(n1782) );
  AOI22_X1M_A9TH U2216 ( .A0(n2304), .A1(regs_receiver_fifo_rx_rfifo_ram[92]), 
        .B0(n2336), .B1(regs_receiver_fifo_rx_rfifo_ram[124]), .Y(n1781) );
  NAND4_X1A_A9TH U2217 ( .A(n1784), .B(n1783), .C(n1782), .D(n1781), .Y(n1790)
         );
  AOI22_X1M_A9TH U2218 ( .A0(n2226), .A1(regs_receiver_fifo_rx_rfifo_ram[4]), 
        .B0(n2255), .B1(regs_receiver_fifo_rx_rfifo_ram[36]), .Y(n1788) );
  AOI22_X1M_A9TH U2219 ( .A0(n2241), .A1(regs_receiver_fifo_rx_rfifo_ram[20]), 
        .B0(n2269), .B1(regs_receiver_fifo_rx_rfifo_ram[52]), .Y(n1787) );
  AOI22_X1M_A9TH U2220 ( .A0(n2283), .A1(regs_receiver_fifo_rx_rfifo_ram[68]), 
        .B0(n2312), .B1(regs_receiver_fifo_rx_rfifo_ram[100]), .Y(n1786) );
  AOI22_X1M_A9TH U2221 ( .A0(n2297), .A1(regs_receiver_fifo_rx_rfifo_ram[84]), 
        .B0(n2328), .B1(regs_receiver_fifo_rx_rfifo_ram[116]), .Y(n1785) );
  NAND4_X1A_A9TH U2222 ( .A(n1788), .B(n1787), .C(n1786), .D(n1785), .Y(n1789)
         );
  OAI21_X1M_A9TH U2223 ( .A0(n1790), .A1(n1789), .B0(n1839), .Y(n1791) );
  NAND4_X1A_A9TH U2224 ( .A(n1794), .B(n1793), .C(n1792), .D(n1791), .Y(
        wb_dat8_o[4]) );
  AOI22_X1M_A9TH U2225 ( .A0(regs_lcr[5]), .A1(n1795), .B0(n2582), .B1(
        regs_scratch[5]), .Y(n1809) );
  AOI22_X1M_A9TH U2226 ( .A0(regs_lsr[5]), .A1(n1827), .B0(n1825), .B1(
        regs_msr[5]), .Y(n1808) );
  AOI22_X1M_A9TH U2227 ( .A0(n1830), .A1(regs_dl[13]), .B0(n1826), .B1(
        regs_dl[5]), .Y(n1807) );
  AOI22_X1M_A9TH U2228 ( .A0(n2276), .A1(regs_receiver_fifo_rx_rfifo_ram[61]), 
        .B0(n2234), .B1(regs_receiver_fifo_rx_rfifo_ram[13]), .Y(n1799) );
  AOI22_X1M_A9TH U2229 ( .A0(n2262), .A1(regs_receiver_fifo_rx_rfifo_ram[45]), 
        .B0(n2248), .B1(regs_receiver_fifo_rx_rfifo_ram[29]), .Y(n1798) );
  AOI22_X1M_A9TH U2230 ( .A0(n2290), .A1(regs_receiver_fifo_rx_rfifo_ram[77]), 
        .B0(n2320), .B1(regs_receiver_fifo_rx_rfifo_ram[109]), .Y(n1797) );
  AOI22_X1M_A9TH U2231 ( .A0(n2304), .A1(regs_receiver_fifo_rx_rfifo_ram[93]), 
        .B0(n2336), .B1(regs_receiver_fifo_rx_rfifo_ram[125]), .Y(n1796) );
  NAND4_X1A_A9TH U2232 ( .A(n1799), .B(n1798), .C(n1797), .D(n1796), .Y(n1805)
         );
  AOI22_X1M_A9TH U2233 ( .A0(n2226), .A1(regs_receiver_fifo_rx_rfifo_ram[5]), 
        .B0(n2255), .B1(regs_receiver_fifo_rx_rfifo_ram[37]), .Y(n1803) );
  AOI22_X1M_A9TH U2234 ( .A0(n2241), .A1(regs_receiver_fifo_rx_rfifo_ram[21]), 
        .B0(n2269), .B1(regs_receiver_fifo_rx_rfifo_ram[53]), .Y(n1802) );
  AOI22_X1M_A9TH U2235 ( .A0(n2283), .A1(regs_receiver_fifo_rx_rfifo_ram[69]), 
        .B0(n2312), .B1(regs_receiver_fifo_rx_rfifo_ram[101]), .Y(n1801) );
  AOI22_X1M_A9TH U2236 ( .A0(n2297), .A1(regs_receiver_fifo_rx_rfifo_ram[85]), 
        .B0(n2328), .B1(regs_receiver_fifo_rx_rfifo_ram[117]), .Y(n1800) );
  NAND4_X1A_A9TH U2237 ( .A(n1803), .B(n1802), .C(n1801), .D(n1800), .Y(n1804)
         );
  OAI21_X1M_A9TH U2238 ( .A0(n1805), .A1(n1804), .B0(n1839), .Y(n1806) );
  NAND4_X1A_A9TH U2239 ( .A(n1809), .B(n1808), .C(n1807), .D(n1806), .Y(
        wb_dat8_o[5]) );
  AOI22_X1M_A9TH U2240 ( .A0(n1825), .A1(regs_msr[6]), .B0(n2582), .B1(
        regs_scratch[6]), .Y(n1824) );
  AOI22_X1M_A9TH U2241 ( .A0(n1827), .A1(regs_lsr[6]), .B0(n1826), .B1(
        regs_dl[6]), .Y(n1823) );
  NOR2_X1M_A9TH U2242 ( .A(n2603), .B(n2595), .Y(n1810) );
  AOI211_X1M_A9TH U2243 ( .A0(n1830), .A1(regs_dl[14]), .B0(n1810), .C0(n1828), 
        .Y(n1822) );
  AOI22_X1M_A9TH U2244 ( .A0(n2276), .A1(regs_receiver_fifo_rx_rfifo_ram[62]), 
        .B0(n2234), .B1(regs_receiver_fifo_rx_rfifo_ram[14]), .Y(n1814) );
  AOI22_X1M_A9TH U2245 ( .A0(n2262), .A1(regs_receiver_fifo_rx_rfifo_ram[46]), 
        .B0(n2248), .B1(regs_receiver_fifo_rx_rfifo_ram[30]), .Y(n1813) );
  AOI22_X1M_A9TH U2246 ( .A0(n2290), .A1(regs_receiver_fifo_rx_rfifo_ram[78]), 
        .B0(n2320), .B1(regs_receiver_fifo_rx_rfifo_ram[110]), .Y(n1812) );
  AOI22_X1M_A9TH U2247 ( .A0(n2304), .A1(regs_receiver_fifo_rx_rfifo_ram[94]), 
        .B0(n2336), .B1(regs_receiver_fifo_rx_rfifo_ram[126]), .Y(n1811) );
  NAND4_X1A_A9TH U2248 ( .A(n1814), .B(n1813), .C(n1812), .D(n1811), .Y(n1820)
         );
  AOI22_X1M_A9TH U2249 ( .A0(n2226), .A1(regs_receiver_fifo_rx_rfifo_ram[6]), 
        .B0(n2255), .B1(regs_receiver_fifo_rx_rfifo_ram[38]), .Y(n1818) );
  AOI22_X1M_A9TH U2250 ( .A0(n2241), .A1(regs_receiver_fifo_rx_rfifo_ram[22]), 
        .B0(n2269), .B1(regs_receiver_fifo_rx_rfifo_ram[54]), .Y(n1817) );
  AOI22_X1M_A9TH U2251 ( .A0(n2283), .A1(regs_receiver_fifo_rx_rfifo_ram[70]), 
        .B0(n2312), .B1(regs_receiver_fifo_rx_rfifo_ram[102]), .Y(n1816) );
  AOI22_X1M_A9TH U2252 ( .A0(n2297), .A1(regs_receiver_fifo_rx_rfifo_ram[86]), 
        .B0(n2328), .B1(regs_receiver_fifo_rx_rfifo_ram[118]), .Y(n1815) );
  NAND4_X1A_A9TH U2253 ( .A(n1818), .B(n1817), .C(n1816), .D(n1815), .Y(n1819)
         );
  OAI21_X1M_A9TH U2254 ( .A0(n1820), .A1(n1819), .B0(n1839), .Y(n1821) );
  NAND4_X1A_A9TH U2255 ( .A(n1824), .B(n1823), .C(n1822), .D(n1821), .Y(
        wb_dat8_o[6]) );
  AOI22_X1M_A9TH U2256 ( .A0(n1825), .A1(regs_msr[7]), .B0(n2582), .B1(
        regs_scratch[7]), .Y(n1845) );
  AOI22_X1M_A9TH U2257 ( .A0(n1827), .A1(regs_lsr[7]), .B0(n1826), .B1(
        regs_dl[7]), .Y(n1844) );
  NOR2_X1M_A9TH U2258 ( .A(n2604), .B(n2595), .Y(n1829) );
  AOI211_X1M_A9TH U2259 ( .A0(n1830), .A1(regs_dl[15]), .B0(n1829), .C0(n1828), 
        .Y(n1843) );
  AOI22_X1M_A9TH U2260 ( .A0(n2276), .A1(regs_receiver_fifo_rx_rfifo_ram[63]), 
        .B0(n2234), .B1(regs_receiver_fifo_rx_rfifo_ram[15]), .Y(n1834) );
  AOI22_X1M_A9TH U2261 ( .A0(n2262), .A1(regs_receiver_fifo_rx_rfifo_ram[47]), 
        .B0(n2248), .B1(regs_receiver_fifo_rx_rfifo_ram[31]), .Y(n1833) );
  AOI22_X1M_A9TH U2262 ( .A0(n2290), .A1(regs_receiver_fifo_rx_rfifo_ram[79]), 
        .B0(n2320), .B1(regs_receiver_fifo_rx_rfifo_ram[111]), .Y(n1832) );
  AOI22_X1M_A9TH U2263 ( .A0(n2304), .A1(regs_receiver_fifo_rx_rfifo_ram[95]), 
        .B0(n2336), .B1(regs_receiver_fifo_rx_rfifo_ram[127]), .Y(n1831) );
  NAND4_X1A_A9TH U2264 ( .A(n1834), .B(n1833), .C(n1832), .D(n1831), .Y(n1841)
         );
  AOI22_X1M_A9TH U2265 ( .A0(n2226), .A1(regs_receiver_fifo_rx_rfifo_ram[7]), 
        .B0(n2255), .B1(regs_receiver_fifo_rx_rfifo_ram[39]), .Y(n1838) );
  AOI22_X1M_A9TH U2266 ( .A0(n2241), .A1(regs_receiver_fifo_rx_rfifo_ram[23]), 
        .B0(n2269), .B1(regs_receiver_fifo_rx_rfifo_ram[55]), .Y(n1837) );
  AOI22_X1M_A9TH U2267 ( .A0(n2283), .A1(regs_receiver_fifo_rx_rfifo_ram[71]), 
        .B0(n2312), .B1(regs_receiver_fifo_rx_rfifo_ram[103]), .Y(n1836) );
  AOI22_X1M_A9TH U2268 ( .A0(n2297), .A1(regs_receiver_fifo_rx_rfifo_ram[87]), 
        .B0(n2328), .B1(regs_receiver_fifo_rx_rfifo_ram[119]), .Y(n1835) );
  NAND4_X1A_A9TH U2269 ( .A(n1838), .B(n1837), .C(n1836), .D(n1835), .Y(n1840)
         );
  OAI21_X1M_A9TH U2270 ( .A0(n1841), .A1(n1840), .B0(n1839), .Y(n1842) );
  NAND4_X1A_A9TH U2271 ( .A(n1845), .B(n1844), .C(n1843), .D(n1842), .Y(
        wb_dat8_o[7]) );
  NOR2XB_X1M_A9TH U2272 ( .BN(wb_interface_wbstate[0]), .A(
        wb_interface_wbstate[1]), .Y(n1481) );
  NOR3_X1M_A9TH U2273 ( .A(n1847), .B(wb_interface_wbstate[1]), .C(
        wb_interface_wbstate[0]), .Y(wb_interface_N14) );
  AOI22_X1M_A9TH U2277 ( .A0(n1854), .A1(n2612), .B0(n1849), .B1(n1852), .Y(
        n1463) );
  AOI22_X1M_A9TH U2278 ( .A0(n1854), .A1(n2615), .B0(n1850), .B1(n1852), .Y(
        n1462) );
  AOI22_X1M_A9TH U2279 ( .A0(n1854), .A1(n2598), .B0(n1851), .B1(n1852), .Y(
        n1461) );
  AOI22_X1M_A9TH U2280 ( .A0(n1854), .A1(n2600), .B0(n1853), .B1(n1852), .Y(
        n1460) );
  NOR2_X1A_A9TH U2281 ( .A(regs_msi_reset), .B(n1855), .Y(n1459) );
  NAND3_X1M_A9TH U2283 ( .A(regs_tf_push), .B(regs_transmitter_fifo_tx_top[1]), 
        .C(regs_transmitter_fifo_tx_top[0]), .Y(n2500) );
  NAND2_X1M_A9TH U2284 ( .A(regs_transmitter_fifo_tx_top[2]), .B(
        regs_transmitter_fifo_tx_top[3]), .Y(n2511) );
  NOR2_X1A_A9TH U2285 ( .A(n2500), .B(n2511), .Y(n2514) );
  AO22_X1M_A9TH U2287 ( .A0(n1927), .A1(regs_transmitter_fifo_tx_tfifo_ram[46]), .B0(n1926), .B1(regs_transmitter_fifo_tx_tfifo_ram[30]), .Y(n1866) );
  AOI22_X1M_A9TH U2288 ( .A0(n2453), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[62]), .B0(n1928), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[78]), .Y(n1859) );
  AOI22_X1M_A9TH U2289 ( .A0(n1930), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[110]), .B0(n1929), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[94]), .Y(n1858) );
  AOI22_X1M_A9TH U2290 ( .A0(n1932), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[14]), .B0(n1931), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[126]), .Y(n1857) );
  NAND4_X1A_A9TH U2291 ( .A(regs_transmitter_fifo_tx_bottom[0]), .B(n1859), 
        .C(n1858), .D(n1857), .Y(n1865) );
  AO22_X1M_A9TH U2292 ( .A0(n1927), .A1(regs_transmitter_fifo_tx_tfifo_ram[38]), .B0(n1926), .B1(regs_transmitter_fifo_tx_tfifo_ram[22]), .Y(n1864) );
  AOI22_X1M_A9TH U2293 ( .A0(n2453), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[54]), .B0(n1928), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[70]), .Y(n1862) );
  AOI22_X1M_A9TH U2294 ( .A0(n1930), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[102]), .B0(n1929), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[86]), .Y(n1861) );
  AOI22_X1M_A9TH U2295 ( .A0(n1932), .A1(regs_transmitter_fifo_tx_tfifo_ram[6]), .B0(n1931), .B1(regs_transmitter_fifo_tx_tfifo_ram[118]), .Y(n1860) );
  NAND4_X1A_A9TH U2296 ( .A(n1862), .B(n1861), .C(n1860), .D(n2455), .Y(n1863)
         );
  OAI22_X1M_A9TH U2297 ( .A0(n1866), .A1(n1865), .B0(n1864), .B1(n1863), .Y(
        n1981) );
  AOI22_X1M_A9TH U2298 ( .A0(n1932), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[15]), .B0(n1931), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[127]), .Y(n1877) );
  AOI22_X1M_A9TH U2299 ( .A0(n1927), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[47]), .B0(n1926), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[31]), .Y(n1869) );
  AOI22_X1M_A9TH U2300 ( .A0(n2453), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[63]), .B0(n1928), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[79]), .Y(n1868) );
  AOI22_X1M_A9TH U2301 ( .A0(n1930), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[111]), .B0(n1929), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[95]), .Y(n1867) );
  AND3_X1M_A9TH U2302 ( .A(n1869), .B(n1868), .C(n1867), .Y(n1876) );
  AND2_X1M_A9TH U2303 ( .A(n1926), .B(regs_transmitter_fifo_tx_tfifo_ram[23]), 
        .Y(n1874) );
  AOI22_X1M_A9TH U2304 ( .A0(n2453), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[55]), .B0(n1928), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[71]), .Y(n1872) );
  AOI22_X1M_A9TH U2305 ( .A0(n1930), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[103]), .B0(n1929), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[87]), .Y(n1871) );
  AOI22_X1M_A9TH U2306 ( .A0(n1932), .A1(regs_transmitter_fifo_tx_tfifo_ram[7]), .B0(n1931), .B1(regs_transmitter_fifo_tx_tfifo_ram[119]), .Y(n1870) );
  NAND4_X1A_A9TH U2307 ( .A(n1872), .B(n1871), .C(n1870), .D(n2455), .Y(n1873)
         );
  AOI211_X1M_A9TH U2308 ( .A0(regs_transmitter_fifo_tx_tfifo_ram[39]), .A1(
        n1927), .B0(n1874), .C0(n1873), .Y(n1875) );
  AOI31_X1M_A9TH U2309 ( .A0(n1877), .A1(regs_transmitter_fifo_tx_bottom[0]), 
        .A2(n1876), .B0(n1875), .Y(n1962) );
  NAND2_X1M_A9TH U2310 ( .A(regs_lcr[0]), .B(n1962), .Y(n1879) );
  NOR2_X1A_A9TH U2311 ( .A(n1981), .B(n1879), .Y(n1878) );
  AOI211_X1M_A9TH U2312 ( .A0(n1981), .A1(n1879), .B0(n2614), .C0(n1878), .Y(
        n1882) );
  NOR2_X1A_A9TH U2313 ( .A(regs_lcr[1]), .B(regs_lcr[0]), .Y(n2182) );
  NAND2_X1M_A9TH U2314 ( .A(n1881), .B(n1882), .Y(n1880) );
  OAI211_X1M_A9TH U2315 ( .A0(n1882), .A1(n1881), .B0(n2178), .C0(n1880), .Y(
        n1942) );
  AO22_X1M_A9TH U2316 ( .A0(n1927), .A1(regs_transmitter_fifo_tx_tfifo_ram[40]), .B0(n1926), .B1(regs_transmitter_fifo_tx_tfifo_ram[24]), .Y(n1892) );
  AOI22_X1M_A9TH U2317 ( .A0(n2453), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[56]), .B0(n1928), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[72]), .Y(n1885) );
  AOI22_X1M_A9TH U2318 ( .A0(n1930), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[104]), .B0(n1929), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[88]), .Y(n1884) );
  AOI22_X1M_A9TH U2319 ( .A0(n1932), .A1(regs_transmitter_fifo_tx_tfifo_ram[8]), .B0(n1931), .B1(regs_transmitter_fifo_tx_tfifo_ram[120]), .Y(n1883) );
  NAND4_X1A_A9TH U2320 ( .A(regs_transmitter_fifo_tx_bottom[0]), .B(n1885), 
        .C(n1884), .D(n1883), .Y(n1891) );
  AO22_X1M_A9TH U2321 ( .A0(n1927), .A1(regs_transmitter_fifo_tx_tfifo_ram[32]), .B0(n1926), .B1(regs_transmitter_fifo_tx_tfifo_ram[16]), .Y(n1890) );
  AOI22_X1M_A9TH U2322 ( .A0(n2453), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[48]), .B0(n1928), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[64]), .Y(n1888) );
  AOI22_X1M_A9TH U2323 ( .A0(n1930), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[96]), .B0(n1929), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[80]), .Y(n1887) );
  AOI22_X1M_A9TH U2324 ( .A0(n1932), .A1(regs_transmitter_fifo_tx_tfifo_ram[0]), .B0(n1931), .B1(regs_transmitter_fifo_tx_tfifo_ram[112]), .Y(n1886) );
  NAND4_X1A_A9TH U2325 ( .A(n1888), .B(n1887), .C(n1886), .D(n2455), .Y(n1889)
         );
  OAI22_X1M_A9TH U2326 ( .A0(n1892), .A1(n1891), .B0(n1890), .B1(n1889), .Y(
        n1958) );
  AO22_X1M_A9TH U2327 ( .A0(n1927), .A1(regs_transmitter_fifo_tx_tfifo_ram[44]), .B0(n1926), .B1(regs_transmitter_fifo_tx_tfifo_ram[28]), .Y(n1902) );
  AOI22_X1M_A9TH U2328 ( .A0(n2453), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[60]), .B0(n1928), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[76]), .Y(n1895) );
  AOI22_X1M_A9TH U2329 ( .A0(n1930), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[108]), .B0(n1929), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[92]), .Y(n1894) );
  AOI22_X1M_A9TH U2330 ( .A0(n1932), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[12]), .B0(n1931), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[124]), .Y(n1893) );
  NAND4_X1A_A9TH U2331 ( .A(regs_transmitter_fifo_tx_bottom[0]), .B(n1895), 
        .C(n1894), .D(n1893), .Y(n1901) );
  AO22_X1M_A9TH U2332 ( .A0(n1927), .A1(regs_transmitter_fifo_tx_tfifo_ram[36]), .B0(n1926), .B1(regs_transmitter_fifo_tx_tfifo_ram[20]), .Y(n1900) );
  AOI22_X1M_A9TH U2333 ( .A0(n2453), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[52]), .B0(n1928), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[68]), .Y(n1898) );
  AOI22_X1M_A9TH U2334 ( .A0(n1930), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[100]), .B0(n1929), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[84]), .Y(n1897) );
  AOI22_X1M_A9TH U2335 ( .A0(n1932), .A1(regs_transmitter_fifo_tx_tfifo_ram[4]), .B0(n1931), .B1(regs_transmitter_fifo_tx_tfifo_ram[116]), .Y(n1896) );
  NAND4_X1A_A9TH U2336 ( .A(n1898), .B(n1897), .C(n1896), .D(n2455), .Y(n1899)
         );
  OAI22_X1M_A9TH U2337 ( .A0(n1902), .A1(n1901), .B0(n1900), .B1(n1899), .Y(
        n1977) );
  AO22_X1M_A9TH U2338 ( .A0(n1927), .A1(regs_transmitter_fifo_tx_tfifo_ram[43]), .B0(n1926), .B1(regs_transmitter_fifo_tx_tfifo_ram[27]), .Y(n1912) );
  AOI22_X1M_A9TH U2339 ( .A0(n2453), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[59]), .B0(n1928), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[75]), .Y(n1905) );
  AOI22_X1M_A9TH U2340 ( .A0(n1930), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[107]), .B0(n1929), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[91]), .Y(n1904) );
  AOI22_X1M_A9TH U2341 ( .A0(n1932), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[11]), .B0(n1931), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[123]), .Y(n1903) );
  NAND4_X1A_A9TH U2342 ( .A(regs_transmitter_fifo_tx_bottom[0]), .B(n1905), 
        .C(n1904), .D(n1903), .Y(n1911) );
  AO22_X1M_A9TH U2343 ( .A0(n1927), .A1(regs_transmitter_fifo_tx_tfifo_ram[35]), .B0(n1926), .B1(regs_transmitter_fifo_tx_tfifo_ram[19]), .Y(n1910) );
  AOI22_X1M_A9TH U2344 ( .A0(n2453), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[51]), .B0(n1928), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[67]), .Y(n1908) );
  AOI22_X1M_A9TH U2345 ( .A0(n1930), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[99]), .B0(n1929), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[83]), .Y(n1907) );
  AOI22_X1M_A9TH U2346 ( .A0(n1932), .A1(regs_transmitter_fifo_tx_tfifo_ram[3]), .B0(n1931), .B1(regs_transmitter_fifo_tx_tfifo_ram[115]), .Y(n1906) );
  NAND4_X1A_A9TH U2347 ( .A(n1908), .B(n1907), .C(n1906), .D(n2455), .Y(n1909)
         );
  OAI22_X1M_A9TH U2348 ( .A0(n1912), .A1(n1911), .B0(n1910), .B1(n1909), .Y(
        n1975) );
  XNOR3_X1M_A9TH U2349 ( .A(n1958), .B(n1977), .C(n1975), .Y(n1940) );
  AO22_X1M_A9TH U2350 ( .A0(n1927), .A1(regs_transmitter_fifo_tx_tfifo_ram[42]), .B0(n1926), .B1(regs_transmitter_fifo_tx_tfifo_ram[26]), .Y(n1922) );
  AOI22_X1M_A9TH U2351 ( .A0(n2453), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[58]), .B0(n1928), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[74]), .Y(n1915) );
  AOI22_X1M_A9TH U2352 ( .A0(n1930), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[106]), .B0(n1929), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[90]), .Y(n1914) );
  AOI22_X1M_A9TH U2353 ( .A0(n1932), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[10]), .B0(n1931), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[122]), .Y(n1913) );
  NAND4_X1A_A9TH U2354 ( .A(regs_transmitter_fifo_tx_bottom[0]), .B(n1915), 
        .C(n1914), .D(n1913), .Y(n1921) );
  AO22_X1M_A9TH U2355 ( .A0(n1927), .A1(regs_transmitter_fifo_tx_tfifo_ram[34]), .B0(n1926), .B1(regs_transmitter_fifo_tx_tfifo_ram[18]), .Y(n1920) );
  AOI22_X1M_A9TH U2356 ( .A0(n2453), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[50]), .B0(n1928), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[66]), .Y(n1918) );
  AOI22_X1M_A9TH U2357 ( .A0(n1930), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[98]), .B0(n1929), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[82]), .Y(n1917) );
  AOI22_X1M_A9TH U2358 ( .A0(n1932), .A1(regs_transmitter_fifo_tx_tfifo_ram[2]), .B0(n1931), .B1(regs_transmitter_fifo_tx_tfifo_ram[114]), .Y(n1916) );
  NAND4_X1A_A9TH U2359 ( .A(n1918), .B(n1917), .C(n1916), .D(n2455), .Y(n1919)
         );
  OAI22_X1M_A9TH U2360 ( .A0(n1922), .A1(n1921), .B0(n1920), .B1(n1919), .Y(
        n1973) );
  AO22_X1M_A9TH U2361 ( .A0(n1927), .A1(regs_transmitter_fifo_tx_tfifo_ram[41]), .B0(n1926), .B1(regs_transmitter_fifo_tx_tfifo_ram[25]), .Y(n1939) );
  AOI22_X1M_A9TH U2362 ( .A0(n2453), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[57]), .B0(n1928), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[73]), .Y(n1925) );
  AOI22_X1M_A9TH U2363 ( .A0(n1930), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[105]), .B0(n1929), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[89]), .Y(n1924) );
  AOI22_X1M_A9TH U2364 ( .A0(n1932), .A1(regs_transmitter_fifo_tx_tfifo_ram[9]), .B0(n1931), .B1(regs_transmitter_fifo_tx_tfifo_ram[121]), .Y(n1923) );
  NAND4_X1A_A9TH U2365 ( .A(regs_transmitter_fifo_tx_bottom[0]), .B(n1925), 
        .C(n1924), .D(n1923), .Y(n1938) );
  AO22_X1M_A9TH U2366 ( .A0(n1927), .A1(regs_transmitter_fifo_tx_tfifo_ram[33]), .B0(n1926), .B1(regs_transmitter_fifo_tx_tfifo_ram[17]), .Y(n1937) );
  AOI22_X1M_A9TH U2367 ( .A0(n2453), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[49]), .B0(n1928), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[65]), .Y(n1935) );
  AOI22_X1M_A9TH U2368 ( .A0(n1930), .A1(
        regs_transmitter_fifo_tx_tfifo_ram[97]), .B0(n1929), .B1(
        regs_transmitter_fifo_tx_tfifo_ram[81]), .Y(n1934) );
  AOI22_X1M_A9TH U2369 ( .A0(n1932), .A1(regs_transmitter_fifo_tx_tfifo_ram[1]), .B0(n1931), .B1(regs_transmitter_fifo_tx_tfifo_ram[113]), .Y(n1933) );
  NAND4_X1A_A9TH U2370 ( .A(n1935), .B(n1934), .C(n1933), .D(n2455), .Y(n1936)
         );
  OAI22_X1M_A9TH U2371 ( .A0(n1939), .A1(n1938), .B0(n1937), .B1(n1936), .Y(
        n1971) );
  XNOR3_X1M_A9TH U2372 ( .A(n1940), .B(n1973), .C(n1971), .Y(n1941) );
  XNOR2_X1M_A9TH U2373 ( .A(n1942), .B(n1941), .Y(n1943) );
  AOI22_X1M_A9TH U2374 ( .A0(n1965), .A1(n1943), .B0(n1952), .B1(n1984), .Y(
        n1456) );
  AOI21_X1M_A9TH U2375 ( .A0(regs_transmitter_bit_counter[0]), .A1(n1948), 
        .B0(n1979), .Y(n1967) );
  AOI32_X1M_A9TH U2376 ( .A0(n1967), .A1(n1984), .A2(n1968), .B0(n1944), .B1(
        n1984), .Y(n1455) );
  AOI21_X1M_A9TH U2377 ( .A0(regs_tstate[2]), .A1(n2517), .B0(n2017), .Y(n2516) );
  OAI21_X1M_A9TH U2378 ( .A0(n2516), .A1(n2215), .B0(n1945), .Y(n2022) );
  INV_X1B_A9TH U2379 ( .A(regs_tstate[1]), .Y(n1950) );
  NAND2_X1M_A9TH U2380 ( .A(n2019), .B(n2599), .Y(n1947) );
  AOI22_X1M_A9TH U2381 ( .A0(n1948), .A1(n1947), .B0(n1946), .B1(n2068), .Y(
        n1949) );
  AOI22_X1M_A9TH U2382 ( .A0(n2024), .A1(n1950), .B0(n1949), .B1(n2022), .Y(
        n1454) );
  NOR2_X1A_A9TH U2383 ( .A(n2599), .B(n1957), .Y(n2018) );
  AO21B_X1M_A9TH U2384 ( .A0(n1951), .A1(n2018), .B0N(n1979), .Y(n1961) );
  NOR2_X1A_A9TH U2385 ( .A(regs_lcr[5]), .B(n1952), .Y(n1954) );
  NAND2_X1M_A9TH U2386 ( .A(regs_lcr[4]), .B(n1954), .Y(n1953) );
  OAI211_X1M_A9TH U2387 ( .A0(regs_lcr[4]), .A1(n1954), .B0(n2019), .C0(n1953), 
        .Y(n1955) );
  OAI21_X1M_A9TH U2388 ( .A0(regs_transmitter_shift_out[0]), .A1(n2019), .B0(
        n1955), .Y(n1956) );
  OAI22_X1M_A9TH U2389 ( .A0(n2020), .A1(n1958), .B0(n1957), .B1(n1956), .Y(
        n1959) );
  NAND2_X1M_A9TH U2390 ( .A(n1961), .B(n1959), .Y(n1960) );
  OAI2XB1_X1M_A9TH U2391 ( .A1N(regs_transmitter_bit_out), .A0(n1961), .B0(
        n1960), .Y(n1453) );
  AO22_X1M_A9TH U2392 ( .A0(n1965), .A1(n1962), .B0(
        regs_transmitter_shift_out[6]), .B1(n1984), .Y(n1452) );
  AOI22_X1M_A9TH U2393 ( .A0(regs_transmitter_bit_counter[0]), .A1(n1979), 
        .B0(n1978), .B1(n1964), .Y(n1963) );
  OAI21_X1M_A9TH U2394 ( .A0(n2611), .A1(n1984), .B0(n1963), .Y(n1451) );
  NAND2_X1M_A9TH U2395 ( .A(n1978), .B(n1964), .Y(n1969) );
  NAND2_X1M_A9TH U2396 ( .A(regs_lcr[1]), .B(n1965), .Y(n1966) );
  OAI221_X1M_A9TH U2397 ( .A0(regs_transmitter_bit_counter[1]), .A1(n1969), 
        .B0(n1968), .B1(n1967), .C0(n1966), .Y(n1450) );
  AOI22_X1M_A9TH U2398 ( .A0(regs_transmitter_shift_out[0]), .A1(n1979), .B0(
        n1978), .B1(regs_transmitter_shift_out[1]), .Y(n1970) );
  OAI21_X1M_A9TH U2399 ( .A0(n1971), .A1(n1984), .B0(n1970), .Y(n1449) );
  AOI22_X1M_A9TH U2400 ( .A0(n1979), .A1(regs_transmitter_shift_out[1]), .B0(
        n1978), .B1(regs_transmitter_shift_out[2]), .Y(n1972) );
  OAI21_X1M_A9TH U2401 ( .A0(n1973), .A1(n1984), .B0(n1972), .Y(n1448) );
  AOI22_X1M_A9TH U2402 ( .A0(n1979), .A1(regs_transmitter_shift_out[2]), .B0(
        n1978), .B1(regs_transmitter_shift_out[3]), .Y(n1974) );
  OAI21_X1M_A9TH U2403 ( .A0(n1975), .A1(n1984), .B0(n1974), .Y(n1447) );
  AOI22_X1M_A9TH U2404 ( .A0(n1979), .A1(regs_transmitter_shift_out[3]), .B0(
        n1978), .B1(regs_transmitter_shift_out[4]), .Y(n1976) );
  OAI21_X1M_A9TH U2405 ( .A0(n1977), .A1(n1984), .B0(n1976), .Y(n1446) );
  AOI22_X1M_A9TH U2406 ( .A0(n1979), .A1(regs_transmitter_shift_out[5]), .B0(
        regs_transmitter_shift_out[6]), .B1(n1978), .Y(n1980) );
  OAI21_X1M_A9TH U2407 ( .A0(n1981), .A1(n1984), .B0(n1980), .Y(n1444) );
  AOI21_X1M_A9TH U2408 ( .A0(n2068), .A1(n2450), .B0(regs_tstate[0]), .Y(n1982) );
  OAI211_X1M_A9TH U2409 ( .A0(regs_tstate[1]), .A1(n1982), .B0(regs_enable), 
        .C0(regs_transmitter_tf_pop), .Y(n1983) );
  NAND2_X1M_A9TH U2410 ( .A(n1984), .B(n1983), .Y(n1443) );
  NOR2_X1A_A9TH U2411 ( .A(n1985), .B(regs_transmitter_tf_pop), .Y(n2007) );
  NAND2_X1M_A9TH U2412 ( .A(regs_transmitter_tf_pop), .B(n1985), .Y(n2000) );
  AOI211_X1M_A9TH U2414 ( .A0(n2007), .A1(n2465), .B0(regs_tx_reset), .C0(
        n1987), .Y(n2001) );
  OA22_X1M_A9TH U2416 ( .A0(n2008), .A1(n2001), .B0(n2006), .B1(
        regs_tf_count[0]), .Y(n1442) );
  INV_X1B_A9TH U2417 ( .A(n1996), .Y(n1992) );
  NOR3_X1M_A9TH U2418 ( .A(n2008), .B(n2010), .C(n2003), .Y(n1989) );
  INV_X1B_A9TH U2419 ( .A(n2007), .Y(n1999) );
  OAI22_X1M_A9TH U2420 ( .A0(n1992), .A1(n2000), .B0(n1989), .B1(n1999), .Y(
        n1988) );
  AOI21_X1M_A9TH U2421 ( .A0(n2466), .A1(n1988), .B0(n2001), .Y(n1995) );
  AND2_X1M_A9TH U2422 ( .A(n2007), .B(n1989), .Y(n1991) );
  OAI211_X1M_A9TH U2423 ( .A0(regs_tf_count[4]), .A1(n1991), .B0(
        regs_tf_count[3]), .C0(n2006), .Y(n1990) );
  OAI21_X1M_A9TH U2424 ( .A0(n1995), .A1(n2465), .B0(n1990), .Y(n1441) );
  AOI32_X1M_A9TH U2425 ( .A0(n1992), .A1(n2006), .A2(n2009), .B0(n1991), .B1(
        n2006), .Y(n1994) );
  INV_X1B_A9TH U2426 ( .A(regs_tf_count[3]), .Y(n1993) );
  AOI22_X1M_A9TH U2427 ( .A0(regs_tf_count[3]), .A1(n1995), .B0(n1994), .B1(
        n1993), .Y(n1440) );
  AOI32_X1M_A9TH U2428 ( .A0(regs_tf_count[0]), .A1(n2003), .A2(n2007), .B0(
        n2009), .B1(regs_tf_count[2]), .Y(n1997) );
  OAI22_X1M_A9TH U2429 ( .A0(n1997), .A1(n2010), .B0(n1996), .B1(n2000), .Y(
        n1998) );
  AOI31_X1M_A9TH U2430 ( .A0(regs_tf_count[2]), .A1(n2007), .A2(n2010), .B0(
        n1998), .Y(n2005) );
  AOI22_X1M_A9TH U2431 ( .A0(regs_tf_count[0]), .A1(n2000), .B0(n1999), .B1(
        n2008), .Y(n2002) );
  AOI21_X1M_A9TH U2432 ( .A0(n2002), .A1(n2466), .B0(n2001), .Y(n2012) );
  OAI22_X1M_A9TH U2433 ( .A0(n2005), .A1(n2004), .B0(n2012), .B1(n2003), .Y(
        n1439) );
  OAI221_X1M_A9TH U2434 ( .A0(regs_tf_count[0]), .A1(n2009), .B0(n2008), .B1(
        n2007), .C0(n2006), .Y(n2011) );
  AOI22_X1M_A9TH U2435 ( .A0(regs_tf_count[1]), .A1(n2012), .B0(n2011), .B1(
        n2010), .Y(n1438) );
  OAI21_X1M_A9TH U2436 ( .A0(regs_lcr[3]), .A1(n2013), .B0(n2021), .Y(n2014)
         );
  AOI22_X1M_A9TH U2437 ( .A0(regs_tstate[1]), .A1(n2014), .B0(n2534), .B1(
        n2450), .Y(n2016) );
  NAND2_X1M_A9TH U2438 ( .A(n2068), .B(n2022), .Y(n2015) );
  OAI22_X1M_A9TH U2439 ( .A0(n2016), .A1(n2015), .B0(n2068), .B1(n2022), .Y(
        n1437) );
  AOI22_X1M_A9TH U2440 ( .A0(n2019), .A1(n2018), .B0(n2017), .B1(n2450), .Y(
        n2023) );
  OAI221_X1M_A9TH U2441 ( .A0(n2024), .A1(n2023), .B0(n2022), .B1(n2021), .C0(
        n2020), .Y(n1436) );
  NOR2_X1A_A9TH U2442 ( .A(n2026), .B(n2025), .Y(n2049) );
  NAND2_X1M_A9TH U2443 ( .A(regs_enable), .B(n2066), .Y(n2027) );
  NOR2_X1A_A9TH U2444 ( .A(n2028), .B(n2027), .Y(n2044) );
  INV_X1B_A9TH U2445 ( .A(regs_block_cnt[1]), .Y(n2029) );
  NAND2_X1M_A9TH U2446 ( .A(n2066), .B(n2055), .Y(n2038) );
  NAND2_X1M_A9TH U2447 ( .A(n2031), .B(n2038), .Y(n2032) );
  AOI32_X1M_A9TH U2448 ( .A0(n2044), .A1(n2029), .A2(n2031), .B0(
        regs_block_cnt[1]), .B1(n2032), .Y(n2030) );
  NAND2_X1M_A9TH U2449 ( .A(n2030), .B(n2066), .Y(n1435) );
  OAI221_X1M_A9TH U2450 ( .A0(regs_block_cnt[0]), .A1(n2055), .B0(n2031), .B1(
        n2044), .C0(n2066), .Y(n1434) );
  OAI21_X1M_A9TH U2451 ( .A0(regs_block_cnt[1]), .A1(n2032), .B0(
        regs_block_cnt[2]), .Y(n2033) );
  OAI211_X1M_A9TH U2452 ( .A0(n2039), .A1(n2055), .B0(n2066), .C0(n2033), .Y(
        n1433) );
  NAND2_X1M_A9TH U2453 ( .A(n2182), .B(regs_lcr[2]), .Y(n2388) );
  OAI21_X1M_A9TH U2454 ( .A0(n2055), .A1(n2036), .B0(n2038), .Y(n2034) );
  AOI32_X1M_A9TH U2455 ( .A0(n2036), .A1(n2035), .A2(n2044), .B0(
        regs_block_cnt[3]), .B1(n2034), .Y(n2037) );
  OAI21_X1M_A9TH U2456 ( .A0(n2524), .A1(n2066), .B0(n2037), .Y(n1432) );
  NAND2_X1M_A9TH U2457 ( .A(n2599), .B(n2597), .Y(n2087) );
  NAND2_X1M_A9TH U2458 ( .A(regs_lcr[3]), .B(regs_lcr[2]), .Y(n2089) );
  NAND2_X1M_A9TH U2459 ( .A(n2087), .B(n2089), .Y(n2047) );
  AOI32_X1M_A9TH U2460 ( .A0(n2087), .A1(regs_lcr[0]), .A2(n2089), .B0(n2611), 
        .B1(n2047), .Y(n2083) );
  AOI221_X1M_A9TH U2461 ( .A0(regs_block_cnt[3]), .A1(n2044), .B0(n2039), .B1(
        n2044), .C0(n2042), .Y(n2040) );
  OAI222_X1M_A9TH U2462 ( .A0(n2055), .A1(n2043), .B0(n2066), .B1(n2083), .C0(
        n2041), .C1(n2040), .Y(n1431) );
  AOI21_X1M_A9TH U2463 ( .A0(n2044), .A1(n2043), .B0(n2042), .Y(n2054) );
  OAI21_X1M_A9TH U2465 ( .A0(regs_lcr[3]), .A1(regs_lcr[0]), .B0(n2614), .Y(
        n2046) );
  AOI211_X1M_A9TH U2466 ( .A0(regs_lcr[3]), .A1(regs_lcr[0]), .B0(regs_lcr[2]), 
        .C0(n2046), .Y(n2053) );
  NAND2_X1M_A9TH U2467 ( .A(regs_lcr[1]), .B(regs_lcr[0]), .Y(n2191) );
  NAND2_X1M_A9TH U2468 ( .A(n2614), .B(n2047), .Y(n2048) );
  OAI21_X1M_A9TH U2469 ( .A0(n2087), .A1(regs_lcr[0]), .B0(regs_lcr[1]), .Y(
        n2061) );
  AOI21_X1M_A9TH U2470 ( .A0(n2048), .A1(n2061), .B0(n2524), .Y(n2059) );
  OAI21_X1M_A9TH U2471 ( .A0(n2089), .A1(n2191), .B0(n2059), .Y(n2050) );
  OAI21_X1M_A9TH U2472 ( .A0(n2053), .A1(n2050), .B0(n2049), .Y(n2051) );
  OAI211_X1M_A9TH U2473 ( .A0(n2054), .A1(n2056), .B0(n2052), .C0(n2051), .Y(
        n1430) );
  AOI21_X1M_A9TH U2474 ( .A0(n2182), .A1(n2599), .B0(n2053), .Y(n2410) );
  OAI21_X1M_A9TH U2475 ( .A0(n2056), .A1(n2055), .B0(n2054), .Y(n2063) );
  INV_X1B_A9TH U2476 ( .A(regs_block_cnt[6]), .Y(n2057) );
  AOI22_X1M_A9TH U2477 ( .A0(regs_block_cnt[6]), .A1(n2063), .B0(n2058), .B1(
        n2057), .Y(n2060) );
  AOI32_X1M_A9TH U2478 ( .A0(n2410), .A1(n2060), .A2(n2059), .B0(n2066), .B1(
        n2060), .Y(n1429) );
  AOI31_X1M_A9TH U2479 ( .A0(regs_lcr[3]), .A1(regs_lcr[2]), .A2(n2178), .B0(
        n2062), .Y(n2067) );
  AOI21_X1M_A9TH U2480 ( .A0(n2066), .A1(regs_block_cnt[6]), .B0(n2063), .Y(
        n2065) );
  OAI22_X1M_A9TH U2481 ( .A0(n2067), .A1(n2066), .B0(n2065), .B1(n2064), .Y(
        n1428) );
  NAND2_X1M_A9TH U2482 ( .A(n2068), .B(regs_enable), .Y(n2069) );
  INV_X1B_A9TH U2483 ( .A(n2069), .Y(n2070) );
  AOI32_X1M_A9TH U2484 ( .A0(regs_tstate[1]), .A1(n2070), .A2(
        regs_transmitter_bit_out), .B0(regs_transmitter_stx_o_tmp), .B1(n2069), 
        .Y(n2071) );
  OAI21_X1M_A9TH U2485 ( .A0(n2215), .A1(n2517), .B0(n2071), .Y(n1427) );
  AOI32_X1M_A9TH U2486 ( .A0(regs_transmitter_stx_o_tmp), .A1(regs_mcr[4]), 
        .A2(n2603), .B0(regs_srx_pad), .B1(n2592), .Y(n2194) );
  NOR3_X1M_A9TH U2487 ( .A(regs_receiver_counter_b[2]), .B(
        regs_receiver_counter_b[0]), .C(regs_receiver_counter_b[1]), .Y(n2079)
         );
  NOR3_X1M_A9TH U2488 ( .A(regs_receiver_counter_b[4]), .B(
        regs_receiver_counter_b[3]), .C(n2077), .Y(n2094) );
  NAND2_X1M_A9TH U2490 ( .A(regs_enable), .B(n2170), .Y(n2080) );
  INV_X1B_A9TH U2491 ( .A(regs_receiver_counter_b[1]), .Y(n2072) );
  NAND2_X1M_A9TH U2492 ( .A(n2194), .B(n2080), .Y(n2078) );
  NAND2_X1M_A9TH U2493 ( .A(n2074), .B(n2078), .Y(n2075) );
  AOI32_X1M_A9TH U2494 ( .A0(n2112), .A1(n2072), .A2(n2074), .B0(
        regs_receiver_counter_b[1]), .B1(n2075), .Y(n2073) );
  NAND2_X1M_A9TH U2495 ( .A(n2194), .B(n2073), .Y(n1426) );
  OAI221_X1M_A9TH U2496 ( .A0(regs_receiver_counter_b[0]), .A1(n2080), .B0(
        n2074), .B1(n2112), .C0(n2194), .Y(n1425) );
  OAI21_X1M_A9TH U2497 ( .A0(regs_receiver_counter_b[1]), .A1(n2075), .B0(
        regs_receiver_counter_b[2]), .Y(n2076) );
  OAI211_X1M_A9TH U2498 ( .A0(n2077), .A1(n2080), .B0(n2194), .C0(n2076), .Y(
        n1424) );
  NAND2_X1M_A9TH U2499 ( .A(n2079), .B(n2112), .Y(n2082) );
  OAI21_X1M_A9TH U2500 ( .A0(n2080), .A1(n2079), .B0(n2078), .Y(n2084) );
  AOI22_X1M_A9TH U2501 ( .A0(regs_receiver_counter_b[3]), .A1(n2084), .B0(
        n2179), .B1(n2388), .Y(n2081) );
  OAI21_X1M_A9TH U2502 ( .A0(regs_receiver_counter_b[3]), .A1(n2082), .B0(
        n2081), .Y(n1423) );
  AOI32_X1M_A9TH U2503 ( .A0(regs_receiver_counter_b[3]), .A1(
        regs_receiver_counter_b[4]), .A2(n2112), .B0(n2084), .B1(
        regs_receiver_counter_b[4]), .Y(n2085) );
  NAND2_X1M_A9TH U2504 ( .A(n2094), .B(n2112), .Y(n2086) );
  OAI211_X1M_A9TH U2505 ( .A0(n2194), .A1(n2396), .B0(n2085), .C0(n2086), .Y(
        n1422) );
  AOI21_X1M_A9TH U2507 ( .A0(regs_enable), .A1(n2094), .B0(n2179), .Y(n2091)
         );
  AO21B_X1M_A9TH U2510 ( .A0(regs_lcr[1]), .A1(n2090), .B0N(n2410), .Y(n2401)
         );
  AOI22_X1M_A9TH U2511 ( .A0(regs_receiver_counter_b[5]), .A1(n2091), .B0(
        n2179), .B1(n2401), .Y(n2092) );
  AOI31_X1M_A9TH U2513 ( .A0(n2094), .A1(n2093), .A2(n2112), .B0(n2179), .Y(
        n2098) );
  AOI22_X1M_A9TH U2514 ( .A0(regs_receiver_counter_b[6]), .A1(n2098), .B0(
        n2096), .B1(n2095), .Y(n2097) );
  OAI21_X1M_A9TH U2515 ( .A0(n2194), .A1(n2410), .B0(n2097), .Y(n1420) );
  AOI32_X1M_A9TH U2516 ( .A0(regs_receiver_counter_b[6]), .A1(
        regs_receiver_counter_b[7]), .A2(n2112), .B0(n2098), .B1(
        regs_receiver_counter_b[7]), .Y(n2099) );
  OAI21_X1M_A9TH U2517 ( .A0(n2194), .A1(n2414), .B0(n2099), .Y(n1419) );
  NOR2_X1A_A9TH U2518 ( .A(regs_rstate[3]), .B(n2145), .Y(n2148) );
  NAND4_X1A_A9TH U2520 ( .A(regs_receiver_rcounter16[1]), .B(
        regs_receiver_rcounter16[2]), .C(regs_receiver_rcounter16[0]), .D(
        n2168), .Y(n2104) );
  NAND3_X1M_A9TH U2522 ( .A(n2148), .B(n2136), .C(n2175), .Y(n2101) );
  NAND2_X1M_A9TH U2523 ( .A(n2101), .B(regs_receiver_rparity), .Y(n2100) );
  OAI21_X1M_A9TH U2524 ( .A0(n2101), .A1(n2194), .B0(n2100), .Y(n1418) );
  NAND2_X1M_A9TH U2525 ( .A(n2221), .B(regs_rstate[2]), .Y(n2130) );
  NOR2_X1A_A9TH U2526 ( .A(regs_rstate[1]), .B(n2130), .Y(n2113) );
  NAND2_X1M_A9TH U2528 ( .A(n2103), .B(regs_receiver_rframing_error), .Y(n2102) );
  OAI21_X1M_A9TH U2529 ( .A0(n2103), .A1(n2179), .B0(n2102), .Y(n1417) );
  NOR3_X1M_A9TH U2530 ( .A(regs_receiver_rbit_counter[1]), .B(
        regs_receiver_rbit_counter[0]), .C(regs_receiver_rbit_counter[2]), .Y(
        n2132) );
  NOR2_X1A_A9TH U2531 ( .A(regs_rstate[0]), .B(regs_rstate[2]), .Y(n2154) );
  NAND2_X1M_A9TH U2532 ( .A(n2145), .B(n2154), .Y(n2157) );
  NOR3_X1M_A9TH U2533 ( .A(regs_receiver_rcounter16[2]), .B(
        regs_receiver_rcounter16[1]), .C(regs_receiver_rcounter16[0]), .Y(
        n2161) );
  NAND2_X1M_A9TH U2534 ( .A(n2168), .B(n2161), .Y(n2143) );
  NOR2_X1A_A9TH U2535 ( .A(regs_rstate[0]), .B(regs_rstate[1]), .Y(n2106) );
  OAI22_X1M_A9TH U2538 ( .A0(n2147), .A1(n2106), .B0(n2105), .B1(n2104), .Y(
        n2107) );
  AOI31_X1M_A9TH U2539 ( .A0(n2177), .A1(n2148), .A2(n2144), .B0(n2107), .Y(
        n2111) );
  OAI211_X1M_A9TH U2540 ( .A0(n2177), .A1(n2144), .B0(regs_rstate[3]), .C0(
        n2145), .Y(n2110) );
  NAND2_X1M_A9TH U2541 ( .A(n2170), .B(regs_receiver_rframing_error), .Y(n2108) );
  OAI211_X1M_A9TH U2542 ( .A0(regs_rstate[0]), .A1(n2108), .B0(regs_rstate[1]), 
        .C0(regs_rstate[3]), .Y(n2109) );
  AOI31_X1M_A9TH U2543 ( .A0(n2111), .A1(n2110), .A2(n2109), .B0(n2215), .Y(
        n2131) );
  AOI21_X1M_A9TH U2544 ( .A0(n2222), .A1(n2112), .B0(n2131), .Y(n2140) );
  AOI31_X1M_A9TH U2545 ( .A0(n2137), .A1(regs_lcr[3]), .A2(n2132), .B0(n2140), 
        .Y(n2116) );
  NAND2_X1M_A9TH U2546 ( .A(regs_rstate[0]), .B(n2113), .Y(n2217) );
  NAND2_X1M_A9TH U2548 ( .A(regs_rstate[1]), .B(regs_rstate[3]), .Y(n2155) );
  OAI211_X1M_A9TH U2549 ( .A0(n2142), .A1(n2155), .B0(n2154), .C0(n2138), .Y(
        n2115) );
  OAI211_X1M_A9TH U2550 ( .A0(n2116), .A1(n2144), .B0(n2217), .C0(n2115), .Y(
        n1416) );
  AND2_X1M_A9TH U2551 ( .A(regs_rstate[2]), .B(n2148), .Y(n2127) );
  NAND2_X1M_A9TH U2552 ( .A(regs_enable), .B(n2127), .Y(n2119) );
  NOR2_X1A_A9TH U2553 ( .A(regs_rstate[0]), .B(n2119), .Y(n2176) );
  AOI22_X1M_A9TH U2554 ( .A0(regs_lcr[0]), .A1(n2176), .B0(
        regs_receiver_rbit_counter[0]), .B1(n2119), .Y(n2118) );
  NAND2_X1M_A9TH U2555 ( .A(regs_rstate[0]), .B(n2127), .Y(n2156) );
  NAND3B_X1M_A9TH U2557 ( .AN(regs_receiver_rbit_counter[0]), .B(n2128), .C(
        n2117), .Y(n2121) );
  NAND2_X1M_A9TH U2558 ( .A(n2118), .B(n2121), .Y(n1415) );
  AOI21_X1M_A9TH U2559 ( .A0(n2128), .A1(regs_receiver_rbit_counter[0]), .B0(
        n2119), .Y(n2125) );
  NAND2_X1M_A9TH U2560 ( .A(regs_lcr[1]), .B(n2176), .Y(n2120) );
  OAI221_X1M_A9TH U2561 ( .A0(regs_receiver_rbit_counter[1]), .A1(n2121), .B0(
        n2123), .B1(n2125), .C0(n2120), .Y(n1414) );
  INV_X1B_A9TH U2562 ( .A(regs_receiver_rbit_counter[2]), .Y(n2122) );
  AOI32_X1M_A9TH U2563 ( .A0(n2125), .A1(n2124), .A2(n2123), .B0(n2122), .B1(
        n2124), .Y(n1413) );
  NAND2_X1M_A9TH U2564 ( .A(n2148), .B(n2154), .Y(n2187) );
  NOR2_X1A_A9TH U2565 ( .A(regs_rstate[1]), .B(regs_rstate[2]), .Y(n2171) );
  NAND2_X1M_A9TH U2566 ( .A(regs_rstate[3]), .B(n2171), .Y(n2151) );
  NAND3_X1M_A9TH U2567 ( .A(regs_rstate[0]), .B(n2194), .C(n2171), .Y(n2133)
         );
  AOI31_X1M_A9TH U2568 ( .A0(n2187), .A1(n2151), .A2(n2133), .B0(n2140), .Y(
        n2126) );
  AOI31_X1M_A9TH U2569 ( .A0(n2127), .A1(n2144), .A2(n2143), .B0(n2126), .Y(
        n2129) );
  OAI211_X1M_A9TH U2571 ( .A0(n2138), .A1(n2147), .B0(n2129), .C0(n2216), .Y(
        n1412) );
  AOI32_X1M_A9TH U2572 ( .A0(n2132), .A1(n2131), .A2(n2599), .B0(n2130), .B1(
        n2131), .Y(n2135) );
  NAND2_X1M_A9TH U2573 ( .A(n2137), .B(n2144), .Y(n2149) );
  OAI211_X1M_A9TH U2574 ( .A0(regs_rstate[3]), .A1(n2133), .B0(n2149), .C0(
        n2187), .Y(n2134) );
  AO22_X1M_A9TH U2575 ( .A0(regs_rstate[1]), .A1(n2135), .B0(n2138), .B1(n2134), .Y(n1411) );
  OAI22_X1M_A9TH U2576 ( .A0(n2137), .A1(n2148), .B0(n2136), .B1(n2145), .Y(
        n2139) );
  AOI22_X1M_A9TH U2577 ( .A0(n2140), .A1(n2221), .B0(n2139), .B1(n2138), .Y(
        n1410) );
  OR2_X1M_A9TH U2578 ( .A(n2171), .B(n2221), .Y(n2141) );
  AOI32_X1M_A9TH U2579 ( .A0(n2154), .A1(regs_enable), .A2(n2142), .B0(n2141), 
        .B1(regs_enable), .Y(n2164) );
  NOR2_X1A_A9TH U2580 ( .A(regs_receiver_rcounter16[0]), .B(n2164), .Y(n2160)
         );
  NOR2_X1M_A9TH U2581 ( .A(n2144), .B(n2143), .Y(n2152) );
  AOI22_X1M_A9TH U2582 ( .A0(n2148), .A1(n2147), .B0(n2146), .B1(n2145), .Y(
        n2150) );
  OAI211_X1M_A9TH U2583 ( .A0(n2152), .A1(n2151), .B0(n2150), .C0(n2149), .Y(
        n2153) );
  AO22_X1M_A9TH U2584 ( .A0(regs_receiver_rcounter16[0]), .A1(n2164), .B0(
        n2160), .B1(n2153), .Y(n1409) );
  NAND2XB_X1M_A9TH U2585 ( .BN(n2155), .A(n2154), .Y(n2174) );
  OAI211_X1M_A9TH U2586 ( .A0(regs_rstate[3]), .A1(n2157), .B0(n2174), .C0(
        n2156), .Y(n2158) );
  NAND2XB_X1M_A9TH U2587 ( .BN(n2164), .A(n2158), .Y(n2166) );
  NAND2_X1M_A9TH U2588 ( .A(n2160), .B(n2159), .Y(n2162) );
  OAI211_X1M_A9TH U2589 ( .A0(n2160), .A1(n2159), .B0(n2166), .C0(n2162), .Y(
        n1408) );
  NAND2_X1M_A9TH U2590 ( .A(regs_receiver_rcounter16[2]), .B(n2162), .Y(n2163)
         );
  OAI211_X1M_A9TH U2591 ( .A0(n2164), .A1(n2165), .B0(n2166), .C0(n2163), .Y(
        n1407) );
  NOR2_X1A_A9TH U2592 ( .A(n2165), .B(n2164), .Y(n2167) );
  OAI221_X1M_A9TH U2593 ( .A0(regs_receiver_rcounter16[3]), .A1(n2169), .B0(
        n2168), .B1(n2167), .C0(n2166), .Y(n1406) );
  AOI211_X1M_A9TH U2594 ( .A0(regs_receiver_rframing_error), .A1(n2170), .B0(
        n2215), .C0(n2174), .Y(n2223) );
  AOI31_X1M_A9TH U2595 ( .A0(regs_enable), .A1(n2171), .A2(n2221), .B0(n2223), 
        .Y(n2172) );
  MXIT2_X1M_A9TH U2596 ( .A(n2174), .B(n2173), .S0(n2172), .Y(n1405) );
  NAND2_X1M_A9TH U2597 ( .A(n2193), .B(n2175), .Y(n2192) );
  NAND2_X1M_A9TH U2598 ( .A(n2177), .B(n2176), .Y(n2190) );
  NAND2_X1M_A9TH U2599 ( .A(n2192), .B(n2190), .Y(n2181) );
  OAI22_X1M_A9TH U2600 ( .A0(n2201), .A1(n2181), .B0(n2202), .B1(n2192), .Y(
        n1404) );
  OAI22_X1M_A9TH U2601 ( .A0(n2202), .A1(n2181), .B0(n2199), .B1(n2192), .Y(
        n1403) );
  OAI22_X1M_A9TH U2602 ( .A0(n2199), .A1(n2181), .B0(n2200), .B1(n2192), .Y(
        n1402) );
  OAI22_X1M_A9TH U2603 ( .A0(n2200), .A1(n2181), .B0(n2197), .B1(n2192), .Y(
        n1401) );
  AOI22_X1M_A9TH U2604 ( .A0(n2182), .A1(n2179), .B0(regs_receiver_rshift[5]), 
        .B1(n2178), .Y(n2180) );
  OAI22_X1M_A9TH U2605 ( .A0(n2197), .A1(n2181), .B0(n2192), .B1(n2180), .Y(
        n1400) );
  OAI21_X1M_A9TH U2606 ( .A0(n2182), .A1(n2192), .B0(n2190), .Y(n2185) );
  AOI22_X1M_A9TH U2607 ( .A0(regs_lcr[1]), .A1(n2203), .B0(n2194), .B1(n2614), 
        .Y(n2183) );
  NAND2_X1M_A9TH U2608 ( .A(n2185), .B(n2183), .Y(n2184) );
  OAI22_X1M_A9TH U2609 ( .A0(n2185), .A1(n2198), .B0(n2184), .B1(n2187), .Y(
        n1399) );
  OAI21_X1M_A9TH U2610 ( .A0(n2192), .A1(n2614), .B0(n2190), .Y(n2189) );
  AOI22_X1M_A9TH U2611 ( .A0(regs_lcr[0]), .A1(n2204), .B0(n2194), .B1(n2611), 
        .Y(n2186) );
  NAND2_X1M_A9TH U2612 ( .A(n2189), .B(n2186), .Y(n2188) );
  OAI22_X1M_A9TH U2613 ( .A0(n2189), .A1(n2203), .B0(n2188), .B1(n2187), .Y(
        n1398) );
  OAI21_X1M_A9TH U2614 ( .A0(n2192), .A1(n2191), .B0(n2190), .Y(n2196) );
  NAND2_X1M_A9TH U2615 ( .A(n2196), .B(n2193), .Y(n2195) );
  OAI22_X1M_A9TH U2616 ( .A0(n2196), .A1(n2204), .B0(n2195), .B1(n2194), .Y(
        n1397) );
  NAND3_X1M_A9TH U2617 ( .A(regs_enable), .B(regs_rstate[3]), .C(n2222), .Y(
        n2212) );
  AOI22_X1M_A9TH U2618 ( .A0(regs_receiver_rshift[4]), .A1(
        regs_receiver_rshift[5]), .B0(n2198), .B1(n2197), .Y(n2209) );
  AOI22_X1M_A9TH U2619 ( .A0(regs_receiver_rshift[2]), .A1(
        regs_receiver_rshift[3]), .B0(n2200), .B1(n2199), .Y(n2208) );
  AOI22_X1M_A9TH U2620 ( .A0(regs_receiver_rshift[0]), .A1(
        regs_receiver_rshift[1]), .B0(n2202), .B1(n2201), .Y(n2206) );
  AOI22_X1M_A9TH U2621 ( .A0(regs_receiver_rshift[6]), .A1(n2204), .B0(
        regs_receiver_rshift[7]), .B1(n2203), .Y(n2205) );
  XNOR3_X1M_A9TH U2622 ( .A(regs_receiver_rparity), .B(n2206), .C(n2205), .Y(
        n2207) );
  XNOR3_X1M_A9TH U2623 ( .A(n2209), .B(n2208), .C(n2207), .Y(n2211) );
  NAND2_X1M_A9TH U2624 ( .A(n2212), .B(regs_receiver_rparity_xor), .Y(n2210)
         );
  OAI21_X1M_A9TH U2625 ( .A0(n2212), .A1(n2211), .B0(n2210), .Y(n1396) );
  AOI22_X1M_A9TH U2626 ( .A0(regs_lcr[5]), .A1(regs_receiver_rparity), .B0(
        regs_receiver_rparity_xor), .B1(n2601), .Y(n2214) );
  AOI211_X1M_A9TH U2627 ( .A0(n2214), .A1(regs_lcr[4]), .B0(n2217), .C0(n2215), 
        .Y(n2213) );
  OAI21_X1M_A9TH U2628 ( .A0(n2214), .A1(regs_lcr[4]), .B0(n2213), .Y(n2219)
         );
  AOI32_X1M_A9TH U2629 ( .A0(n2217), .A1(regs_receiver_rparity_error), .A2(
        n2216), .B0(n2215), .B1(regs_receiver_rparity_error), .Y(n2218) );
  NAND2_X1M_A9TH U2630 ( .A(n2219), .B(n2218), .Y(n1395) );
  AND2_X1M_A9TH U2631 ( .A(n2223), .B(n2220), .Y(n2448) );
  AOI31_X1M_A9TH U2632 ( .A0(regs_enable), .A1(n2222), .A2(n2221), .B0(n2223), 
        .Y(n2449) );
  AO22_X1M_A9TH U2633 ( .A0(regs_receiver_rframing_error), .A1(n2448), .B0(
        n2449), .B1(regs_receiver_rf_data_in[0]), .Y(n1394) );
  AO22_X1M_A9TH U2634 ( .A0(n2449), .A1(regs_receiver_rf_data_in[1]), .B0(
        n2448), .B1(regs_receiver_rparity_error), .Y(n1393) );
  AO22_X1M_A9TH U2635 ( .A0(n2224), .A1(n2223), .B0(n2449), .B1(
        regs_receiver_rf_data_in[2]), .Y(n1392) );
  NOR2_X1A_A9TH U2636 ( .A(n2422), .B(n2346), .Y(n2345) );
  NAND2_X1M_A9TH U2637 ( .A(n2440), .B(n2439), .Y(n2548) );
  NOR2_X1A_A9TH U2638 ( .A(regs_receiver_fifo_rx_top[1]), .B(
        regs_receiver_fifo_rx_top[0]), .Y(n2538) );
  AOI21_X1M_A9TH U2639 ( .A0(regs_rf_count[4]), .A1(n2420), .B0(n2421), .Y(
        n2444) );
  NAND2_X1M_A9TH U2640 ( .A(n2538), .B(n2444), .Y(n2310) );
  NOR2_X1A_A9TH U2641 ( .A(n2548), .B(n2310), .Y(n2225) );
  AOI211_X1M_A9TH U2642 ( .A0(n2345), .A1(n2226), .B0(regs_rx_reset), .C0(
        n2225), .Y(n2232) );
  NOR2_X1A_A9TH U2643 ( .A(regs_rx_reset), .B(n2421), .Y(n2229) );
  NAND2_X1M_A9TH U2644 ( .A(regs_receiver_rf_data_in[0]), .B(n2229), .Y(n2337)
         );
  NAND2_X1M_A9TH U2645 ( .A(n2232), .B(regs_receiver_fifo_rx_fifo[0]), .Y(
        n2227) );
  OAI21_X1M_A9TH U2646 ( .A0(n2232), .A1(n2337), .B0(n2227), .Y(n1391) );
  NAND2_X1M_A9TH U2647 ( .A(regs_receiver_rf_data_in[2]), .B(n2229), .Y(n2339)
         );
  AOI22_X1M_A9TH U2648 ( .A0(n2232), .A1(n2228), .B0(n2339), .B1(n2230), .Y(
        n1390) );
  NAND2_X1M_A9TH U2649 ( .A(regs_receiver_rf_data_in[1]), .B(n2229), .Y(n2342)
         );
  AOI22_X1M_A9TH U2650 ( .A0(n2232), .A1(n2231), .B0(n2342), .B1(n2230), .Y(
        n1389) );
  NAND2_X1M_A9TH U2652 ( .A(n2444), .B(n2541), .Y(n2318) );
  NOR2_X1A_A9TH U2653 ( .A(n2548), .B(n2318), .Y(n2233) );
  AOI211_X1M_A9TH U2654 ( .A0(n2345), .A1(n2234), .B0(regs_rx_reset), .C0(
        n2233), .Y(n2239) );
  NAND2_X1M_A9TH U2655 ( .A(n2239), .B(regs_receiver_fifo_rx_fifo[3]), .Y(
        n2235) );
  OAI21_X1M_A9TH U2656 ( .A0(n2239), .A1(n2337), .B0(n2235), .Y(n1388) );
  AOI22_X1M_A9TH U2657 ( .A0(n2239), .A1(n2236), .B0(n2339), .B1(n2237), .Y(
        n1387) );
  INV_X1B_A9TH U2658 ( .A(regs_receiver_fifo_rx_fifo[4]), .Y(n2238) );
  AOI22_X1M_A9TH U2659 ( .A0(n2239), .A1(n2238), .B0(n2342), .B1(n2237), .Y(
        n1386) );
  NAND3_X1M_A9TH U2660 ( .A(regs_receiver_fifo_rx_top[1]), .B(n2444), .C(n2544), .Y(n2326) );
  NOR2_X1A_A9TH U2661 ( .A(n2548), .B(n2326), .Y(n2240) );
  AOI211_X1M_A9TH U2662 ( .A0(n2345), .A1(n2241), .B0(regs_rx_reset), .C0(
        n2240), .Y(n2246) );
  NAND2_X1M_A9TH U2663 ( .A(n2246), .B(regs_receiver_fifo_rx_fifo[6]), .Y(
        n2242) );
  OAI21_X1M_A9TH U2664 ( .A0(n2246), .A1(n2337), .B0(n2242), .Y(n1385) );
  AOI22_X1M_A9TH U2665 ( .A0(n2246), .A1(n2243), .B0(n2339), .B1(n2244), .Y(
        n1384) );
  AOI22_X1M_A9TH U2666 ( .A0(n2246), .A1(n2245), .B0(n2342), .B1(n2244), .Y(
        n1383) );
  NOR2_X1A_A9TH U2668 ( .A(n2548), .B(n2334), .Y(n2247) );
  AOI211_X1M_A9TH U2669 ( .A0(n2345), .A1(n2248), .B0(regs_rx_reset), .C0(
        n2247), .Y(n2253) );
  NAND2_X1M_A9TH U2670 ( .A(n2253), .B(regs_receiver_fifo_rx_fifo[9]), .Y(
        n2249) );
  OAI21_X1M_A9TH U2671 ( .A0(n2253), .A1(n2337), .B0(n2249), .Y(n1382) );
  AOI22_X1M_A9TH U2672 ( .A0(n2253), .A1(n2250), .B0(n2339), .B1(n2251), .Y(
        n1381) );
  AOI22_X1M_A9TH U2673 ( .A0(n2253), .A1(n2252), .B0(n2342), .B1(n2251), .Y(
        n1380) );
  NAND2_X1M_A9TH U2674 ( .A(regs_receiver_fifo_rx_top[2]), .B(n2439), .Y(n2557) );
  NOR2_X1A_A9TH U2675 ( .A(n2310), .B(n2557), .Y(n2254) );
  AOI211_X1M_A9TH U2676 ( .A0(n2345), .A1(n2255), .B0(regs_rx_reset), .C0(
        n2254), .Y(n2260) );
  AOI22_X1M_A9TH U2677 ( .A0(n2260), .A1(n2256), .B0(n2337), .B1(n2258), .Y(
        n1379) );
  INV_X1B_A9TH U2678 ( .A(regs_receiver_fifo_rx_fifo[14]), .Y(n2257) );
  AOI22_X1M_A9TH U2679 ( .A0(n2260), .A1(n2257), .B0(n2339), .B1(n2258), .Y(
        n1378) );
  INV_X1B_A9TH U2680 ( .A(regs_receiver_fifo_rx_fifo[13]), .Y(n2259) );
  AOI22_X1M_A9TH U2681 ( .A0(n2260), .A1(n2259), .B0(n2342), .B1(n2258), .Y(
        n1377) );
  AOI211_X1M_A9TH U2683 ( .A0(n2345), .A1(n2262), .B0(regs_rx_reset), .C0(
        n2261), .Y(n2267) );
  INV_X1B_A9TH U2684 ( .A(regs_receiver_fifo_rx_fifo[15]), .Y(n2263) );
  AOI22_X1M_A9TH U2685 ( .A0(n2267), .A1(n2263), .B0(n2337), .B1(n2265), .Y(
        n1376) );
  AOI22_X1M_A9TH U2686 ( .A0(n2267), .A1(n2264), .B0(n2339), .B1(n2265), .Y(
        n1375) );
  INV_X1B_A9TH U2687 ( .A(regs_receiver_fifo_rx_fifo[16]), .Y(n2266) );
  AOI22_X1M_A9TH U2688 ( .A0(n2267), .A1(n2266), .B0(n2342), .B1(n2265), .Y(
        n1374) );
  NOR2_X1A_A9TH U2689 ( .A(n2326), .B(n2557), .Y(n2268) );
  AOI211_X1M_A9TH U2690 ( .A0(n2345), .A1(n2269), .B0(regs_rx_reset), .C0(
        n2268), .Y(n2274) );
  INV_X1B_A9TH U2691 ( .A(regs_receiver_fifo_rx_fifo[18]), .Y(n2270) );
  AOI22_X1M_A9TH U2692 ( .A0(n2274), .A1(n2270), .B0(n2337), .B1(n2272), .Y(
        n1373) );
  INV_X1B_A9TH U2693 ( .A(regs_receiver_fifo_rx_fifo[20]), .Y(n2271) );
  AOI22_X1M_A9TH U2694 ( .A0(n2274), .A1(n2271), .B0(n2339), .B1(n2272), .Y(
        n1372) );
  INV_X1B_A9TH U2695 ( .A(regs_receiver_fifo_rx_fifo[19]), .Y(n2273) );
  AOI22_X1M_A9TH U2696 ( .A0(n2274), .A1(n2273), .B0(n2342), .B1(n2272), .Y(
        n1371) );
  NOR2_X1A_A9TH U2697 ( .A(n2334), .B(n2557), .Y(n2275) );
  AOI211_X1M_A9TH U2698 ( .A0(n2345), .A1(n2276), .B0(regs_rx_reset), .C0(
        n2275), .Y(n2281) );
  AOI22_X1M_A9TH U2699 ( .A0(n2281), .A1(n2277), .B0(n2337), .B1(n2279), .Y(
        n1370) );
  AOI22_X1M_A9TH U2700 ( .A0(n2281), .A1(n2278), .B0(n2339), .B1(n2279), .Y(
        n1369) );
  AOI22_X1M_A9TH U2701 ( .A0(n2281), .A1(n2280), .B0(n2342), .B1(n2279), .Y(
        n1368) );
  NAND2_X1M_A9TH U2702 ( .A(regs_receiver_fifo_rx_top[3]), .B(n2440), .Y(n2566) );
  NOR2_X1A_A9TH U2703 ( .A(n2310), .B(n2566), .Y(n2282) );
  AOI211_X1M_A9TH U2704 ( .A0(n2345), .A1(n2283), .B0(regs_rx_reset), .C0(
        n2282), .Y(n2288) );
  INV_X1B_A9TH U2705 ( .A(regs_receiver_fifo_rx_fifo[24]), .Y(n2284) );
  AOI22_X1M_A9TH U2706 ( .A0(n2288), .A1(n2284), .B0(n2337), .B1(n2286), .Y(
        n1367) );
  INV_X1B_A9TH U2707 ( .A(regs_receiver_fifo_rx_fifo[26]), .Y(n2285) );
  AOI22_X1M_A9TH U2708 ( .A0(n2288), .A1(n2285), .B0(n2339), .B1(n2286), .Y(
        n1366) );
  INV_X1B_A9TH U2709 ( .A(regs_receiver_fifo_rx_fifo[25]), .Y(n2287) );
  AOI22_X1M_A9TH U2710 ( .A0(n2288), .A1(n2287), .B0(n2342), .B1(n2286), .Y(
        n1365) );
  NOR2_X1A_A9TH U2711 ( .A(n2318), .B(n2566), .Y(n2289) );
  AOI211_X1M_A9TH U2712 ( .A0(n2345), .A1(n2290), .B0(regs_rx_reset), .C0(
        n2289), .Y(n2295) );
  INV_X1B_A9TH U2713 ( .A(regs_receiver_fifo_rx_fifo[27]), .Y(n2291) );
  AOI22_X1M_A9TH U2714 ( .A0(n2295), .A1(n2291), .B0(n2337), .B1(n2293), .Y(
        n1364) );
  AOI22_X1M_A9TH U2715 ( .A0(n2295), .A1(n2292), .B0(n2339), .B1(n2293), .Y(
        n1363) );
  INV_X1B_A9TH U2716 ( .A(regs_receiver_fifo_rx_fifo[28]), .Y(n2294) );
  AOI22_X1M_A9TH U2717 ( .A0(n2295), .A1(n2294), .B0(n2342), .B1(n2293), .Y(
        n1362) );
  NOR2_X1A_A9TH U2718 ( .A(n2326), .B(n2566), .Y(n2296) );
  AOI211_X1M_A9TH U2719 ( .A0(n2345), .A1(n2297), .B0(regs_rx_reset), .C0(
        n2296), .Y(n2302) );
  INV_X1B_A9TH U2720 ( .A(regs_receiver_fifo_rx_fifo[30]), .Y(n2298) );
  AOI22_X1M_A9TH U2721 ( .A0(n2302), .A1(n2298), .B0(n2337), .B1(n2300), .Y(
        n1361) );
  INV_X1B_A9TH U2722 ( .A(regs_receiver_fifo_rx_fifo[32]), .Y(n2299) );
  AOI22_X1M_A9TH U2723 ( .A0(n2302), .A1(n2299), .B0(n2339), .B1(n2300), .Y(
        n1360) );
  INV_X1B_A9TH U2724 ( .A(regs_receiver_fifo_rx_fifo[31]), .Y(n2301) );
  AOI22_X1M_A9TH U2725 ( .A0(n2302), .A1(n2301), .B0(n2342), .B1(n2300), .Y(
        n1359) );
  NOR2_X1A_A9TH U2726 ( .A(n2334), .B(n2566), .Y(n2303) );
  AOI211_X1M_A9TH U2727 ( .A0(n2345), .A1(n2304), .B0(regs_rx_reset), .C0(
        n2303), .Y(n2309) );
  INV_X1B_A9TH U2728 ( .A(regs_receiver_fifo_rx_fifo[33]), .Y(n2305) );
  AOI22_X1M_A9TH U2729 ( .A0(n2309), .A1(n2305), .B0(n2337), .B1(n2307), .Y(
        n1358) );
  INV_X1B_A9TH U2730 ( .A(regs_receiver_fifo_rx_fifo[35]), .Y(n2306) );
  AOI22_X1M_A9TH U2731 ( .A0(n2309), .A1(n2306), .B0(n2339), .B1(n2307), .Y(
        n1357) );
  INV_X1B_A9TH U2732 ( .A(regs_receiver_fifo_rx_fifo[34]), .Y(n2308) );
  AOI22_X1M_A9TH U2733 ( .A0(n2309), .A1(n2308), .B0(n2342), .B1(n2307), .Y(
        n1356) );
  NAND2_X1M_A9TH U2734 ( .A(regs_receiver_fifo_rx_top[2]), .B(
        regs_receiver_fifo_rx_top[3]), .Y(n2579) );
  NOR2_X1A_A9TH U2735 ( .A(n2310), .B(n2579), .Y(n2311) );
  AOI211_X1M_A9TH U2736 ( .A0(n2345), .A1(n2312), .B0(regs_rx_reset), .C0(
        n2311), .Y(n2317) );
  INV_X1B_A9TH U2737 ( .A(regs_receiver_fifo_rx_fifo[36]), .Y(n2313) );
  AOI22_X1M_A9TH U2738 ( .A0(n2317), .A1(n2313), .B0(n2337), .B1(n2315), .Y(
        n1355) );
  INV_X1B_A9TH U2739 ( .A(regs_receiver_fifo_rx_fifo[38]), .Y(n2314) );
  AOI22_X1M_A9TH U2740 ( .A0(n2317), .A1(n2314), .B0(n2339), .B1(n2315), .Y(
        n1354) );
  INV_X1B_A9TH U2741 ( .A(regs_receiver_fifo_rx_fifo[37]), .Y(n2316) );
  AOI22_X1M_A9TH U2742 ( .A0(n2317), .A1(n2316), .B0(n2342), .B1(n2315), .Y(
        n1353) );
  AOI211_X1M_A9TH U2744 ( .A0(n2345), .A1(n2320), .B0(regs_rx_reset), .C0(
        n2319), .Y(n2325) );
  INV_X1B_A9TH U2745 ( .A(regs_receiver_fifo_rx_fifo[39]), .Y(n2321) );
  AOI22_X1M_A9TH U2746 ( .A0(n2325), .A1(n2321), .B0(n2337), .B1(n2323), .Y(
        n1352) );
  INV_X1B_A9TH U2747 ( .A(regs_receiver_fifo_rx_fifo[41]), .Y(n2322) );
  AOI22_X1M_A9TH U2748 ( .A0(n2325), .A1(n2322), .B0(n2339), .B1(n2323), .Y(
        n1351) );
  INV_X1B_A9TH U2749 ( .A(regs_receiver_fifo_rx_fifo[40]), .Y(n2324) );
  AOI22_X1M_A9TH U2750 ( .A0(n2325), .A1(n2324), .B0(n2342), .B1(n2323), .Y(
        n1350) );
  NOR2_X1A_A9TH U2751 ( .A(n2326), .B(n2579), .Y(n2327) );
  AOI211_X1M_A9TH U2752 ( .A0(n2345), .A1(n2328), .B0(regs_rx_reset), .C0(
        n2327), .Y(n2333) );
  INV_X1B_A9TH U2753 ( .A(regs_receiver_fifo_rx_fifo[42]), .Y(n2329) );
  AOI22_X1M_A9TH U2754 ( .A0(n2333), .A1(n2329), .B0(n2337), .B1(n2331), .Y(
        n1349) );
  INV_X1B_A9TH U2755 ( .A(regs_receiver_fifo_rx_fifo[44]), .Y(n2330) );
  AOI22_X1M_A9TH U2756 ( .A0(n2333), .A1(n2330), .B0(n2339), .B1(n2331), .Y(
        n1348) );
  INV_X1B_A9TH U2757 ( .A(regs_receiver_fifo_rx_fifo[43]), .Y(n2332) );
  AOI22_X1M_A9TH U2758 ( .A0(n2333), .A1(n2332), .B0(n2342), .B1(n2331), .Y(
        n1347) );
  AOI211_X1M_A9TH U2760 ( .A0(n2345), .A1(n2336), .B0(regs_rx_reset), .C0(
        n2335), .Y(n2344) );
  INV_X1B_A9TH U2761 ( .A(regs_receiver_fifo_rx_fifo[45]), .Y(n2338) );
  AOI22_X1M_A9TH U2762 ( .A0(n2344), .A1(n2338), .B0(n2337), .B1(n2341), .Y(
        n1346) );
  INV_X1B_A9TH U2763 ( .A(regs_receiver_fifo_rx_fifo[47]), .Y(n2340) );
  AOI22_X1M_A9TH U2764 ( .A0(n2344), .A1(n2340), .B0(n2339), .B1(n2341), .Y(
        n1345) );
  INV_X1B_A9TH U2765 ( .A(regs_receiver_fifo_rx_fifo[46]), .Y(n2343) );
  AOI22_X1M_A9TH U2766 ( .A0(n2344), .A1(n2343), .B0(n2342), .B1(n2341), .Y(
        n1344) );
  NOR2_X1A_A9TH U2767 ( .A(n2421), .B(regs_rf_pop), .Y(n2366) );
  AOI211_X1M_A9TH U2768 ( .A0(n2366), .A1(n2350), .B0(n2345), .C0(
        regs_rx_reset), .Y(n2360) );
  OA22_X1M_A9TH U2770 ( .A0(n2367), .A1(n2360), .B0(n2365), .B1(
        regs_rf_count[0]), .Y(n1343) );
  NOR3_X1M_A9TH U2771 ( .A(n2367), .B(n2369), .C(n2362), .Y(n2348) );
  NOR3_X1M_A9TH U2772 ( .A(regs_rf_count[0]), .B(regs_rf_count[1]), .C(
        regs_rf_count[2]), .Y(n2355) );
  OAI22_X1M_A9TH U2773 ( .A0(n2348), .A1(n2359), .B0(n2355), .B1(n2346), .Y(
        n2347) );
  AOI21_X1M_A9TH U2774 ( .A0(n2443), .A1(n2347), .B0(n2360), .Y(n2354) );
  AND2_X1M_A9TH U2775 ( .A(n2366), .B(n2348), .Y(n2351) );
  OAI211_X1M_A9TH U2776 ( .A0(regs_rf_count[4]), .A1(n2351), .B0(
        regs_rf_count[3]), .C0(n2365), .Y(n2349) );
  OAI21_X1M_A9TH U2777 ( .A0(n2354), .A1(n2350), .B0(n2349), .Y(n1342) );
  AOI32_X1M_A9TH U2778 ( .A0(n2368), .A1(n2365), .A2(n2355), .B0(n2351), .B1(
        n2365), .Y(n2353) );
  AOI22_X1M_A9TH U2779 ( .A0(regs_rf_count[3]), .A1(n2354), .B0(n2353), .B1(
        n2352), .Y(n1341) );
  AOI32_X1M_A9TH U2780 ( .A0(regs_rf_count[0]), .A1(n2362), .A2(n2366), .B0(
        n2368), .B1(regs_rf_count[2]), .Y(n2357) );
  NAND2_X1M_A9TH U2781 ( .A(n2368), .B(n2355), .Y(n2356) );
  OAI21_X1M_A9TH U2782 ( .A0(n2357), .A1(n2369), .B0(n2356), .Y(n2358) );
  AOI31_X1M_A9TH U2783 ( .A0(regs_rf_count[2]), .A1(n2366), .A2(n2369), .B0(
        n2358), .Y(n2364) );
  NOR2_X1A_A9TH U2784 ( .A(regs_rf_count[0]), .B(n2359), .Y(n2416) );
  AOI221_X1M_A9TH U2785 ( .A0(n2416), .A1(n2443), .B0(n2361), .B1(n2443), .C0(
        n2360), .Y(n2371) );
  OAI22_X1M_A9TH U2786 ( .A0(n2364), .A1(n2363), .B0(n2371), .B1(n2362), .Y(
        n1340) );
  OAI221_X1M_A9TH U2787 ( .A0(regs_rf_count[0]), .A1(n2368), .B0(n2367), .B1(
        n2366), .C0(n2365), .Y(n2370) );
  AOI22_X1M_A9TH U2788 ( .A0(regs_rf_count[1]), .A1(n2371), .B0(n2370), .B1(
        n2369), .Y(n1339) );
  NAND3_X1M_A9TH U2789 ( .A(n2421), .B(n2420), .C(n2372), .Y(n2402) );
  NAND2_X1M_A9TH U2790 ( .A(regs_enable), .B(n2415), .Y(n2373) );
  NOR2_X1A_A9TH U2791 ( .A(n2374), .B(n2373), .Y(n2399) );
  NAND2_X1M_A9TH U2792 ( .A(n2399), .B(n2378), .Y(n2377) );
  INV_X1B_A9TH U2793 ( .A(regs_counter_t[1]), .Y(n2376) );
  NAND2_X1M_A9TH U2794 ( .A(n2405), .B(n2415), .Y(n2387) );
  NOR2_X1A_A9TH U2795 ( .A(regs_counter_t[0]), .B(n2397), .Y(n2375) );
  OAI221_X1M_A9TH U2796 ( .A0(regs_counter_t[1]), .A1(n2377), .B0(n2376), .B1(
        n2375), .C0(n2415), .Y(n1338) );
  OAI211_X1M_A9TH U2797 ( .A0(n2399), .A1(n2378), .B0(n2415), .C0(n2377), .Y(
        n1337) );
  NOR3_X1M_A9TH U2798 ( .A(regs_counter_t[0]), .B(regs_counter_t[1]), .C(n2397), .Y(n2380) );
  INV_X1B_A9TH U2799 ( .A(regs_counter_t[2]), .Y(n2379) );
  NAND2_X1M_A9TH U2800 ( .A(n2381), .B(n2399), .Y(n2384) );
  OAI211_X1M_A9TH U2801 ( .A0(n2380), .A1(n2379), .B0(n2415), .C0(n2384), .Y(
        n1336) );
  NAND2_X1M_A9TH U2802 ( .A(n2381), .B(n2387), .Y(n2385) );
  OAI221_X1M_A9TH U2803 ( .A0(regs_counter_t[3]), .A1(n2384), .B0(n2383), .B1(
        n2382), .C0(n2415), .Y(n1335) );
  OAI21_X1M_A9TH U2804 ( .A0(regs_counter_t[3]), .A1(n2385), .B0(
        regs_counter_t[4]), .Y(n2386) );
  OAI211_X1M_A9TH U2805 ( .A0(n2393), .A1(n2405), .B0(n2415), .C0(n2386), .Y(
        n1334) );
  AOI22_X1M_A9TH U2808 ( .A0(regs_counter_t[5]), .A1(n2389), .B0(n2402), .B1(
        n2388), .Y(n2390) );
  OAI21_X1M_A9TH U2809 ( .A0(regs_counter_t[5]), .A1(n2391), .B0(n2390), .Y(
        n1333) );
  INV_X1B_A9TH U2810 ( .A(regs_counter_t[6]), .Y(n2395) );
  AOI221_X1M_A9TH U2811 ( .A0(regs_counter_t[5]), .A1(n2399), .B0(n2393), .B1(
        n2399), .C0(n2397), .Y(n2394) );
  OAI222_X1M_A9TH U2812 ( .A0(n2398), .A1(n2405), .B0(n2396), .B1(n2415), .C0(
        n2395), .C1(n2394), .Y(n1332) );
  AOI21_X1M_A9TH U2813 ( .A0(n2399), .A1(n2398), .B0(n2397), .Y(n2404) );
  NOR2_X1A_A9TH U2814 ( .A(n2400), .B(n2405), .Y(n2408) );
  AOI21_X1M_A9TH U2815 ( .A0(n2402), .A1(n2401), .B0(n2408), .Y(n2403) );
  OAI21_X1M_A9TH U2816 ( .A0(n2404), .A1(n2406), .B0(n2403), .Y(n1331) );
  OAI21_X1M_A9TH U2817 ( .A0(n2406), .A1(n2405), .B0(n2404), .Y(n2411) );
  INV_X1B_A9TH U2818 ( .A(regs_counter_t[8]), .Y(n2407) );
  AOI22_X1M_A9TH U2819 ( .A0(regs_counter_t[8]), .A1(n2411), .B0(n2408), .B1(
        n2407), .Y(n2409) );
  OAI21_X1M_A9TH U2820 ( .A0(n2415), .A1(n2410), .B0(n2409), .Y(n1330) );
  AOI21_X1M_A9TH U2821 ( .A0(regs_counter_t[8]), .A1(n2415), .B0(n2411), .Y(
        n2413) );
  OAI22_X1M_A9TH U2822 ( .A0(n2415), .A1(n2414), .B0(n2413), .B1(n2412), .Y(
        n1329) );
  AOI31_X1M_A9TH U2823 ( .A0(n2417), .A1(regs_rf_count[4]), .A2(n2416), .B0(
        regs_rf_overrun), .Y(n2418) );
  NOR3_X1M_A9TH U2824 ( .A(regs_rx_reset), .B(n2419), .C(n2418), .Y(n1328) );
  AOI32_X1M_A9TH U2825 ( .A0(n2422), .A1(n2443), .A2(n2421), .B0(n2420), .B1(
        n2443), .Y(n2424) );
  NAND2_X1M_A9TH U2826 ( .A(n2443), .B(n2424), .Y(n2433) );
  AOI22_X1M_A9TH U2827 ( .A0(regs_receiver_fifo_rx_bottom[0]), .A1(n2424), 
        .B0(n2433), .B1(n2423), .Y(n1327) );
  OAI21_X1M_A9TH U2828 ( .A0(regs_rx_reset), .A1(
        regs_receiver_fifo_rx_bottom[0]), .B0(n2424), .Y(n2432) );
  AOI21_X1M_A9TH U2829 ( .A0(n2443), .A1(n2435), .B0(n2432), .Y(n2430) );
  OAI222_X1M_A9TH U2830 ( .A0(n2433), .A1(n2427), .B0(n2426), .B1(n2430), .C0(
        n2425), .C1(regs_rx_reset), .Y(n1326) );
  OAI22_X1M_A9TH U2832 ( .A0(n2433), .A1(n2431), .B0(n2430), .B1(n2429), .Y(
        n1325) );
  OAI22_X1M_A9TH U2833 ( .A0(n2436), .A1(n2435), .B0(n2434), .B1(n2433), .Y(
        n1324) );
  AOI21_X1M_A9TH U2835 ( .A0(regs_receiver_fifo_rx_top[0]), .A1(n2444), .B0(
        regs_rx_reset), .Y(n2438) );
  NAND4_X1A_A9TH U2837 ( .A(regs_receiver_fifo_rx_top[1]), .B(
        regs_receiver_fifo_rx_top[0]), .C(n2444), .D(n2443), .Y(n2441) );
  AOI21_X1M_A9TH U2838 ( .A0(n2443), .A1(n2445), .B0(n2438), .Y(n2442) );
  OAI222_X1M_A9TH U2839 ( .A0(n2557), .A1(n2441), .B0(n2566), .B1(
        regs_rx_reset), .C0(n2439), .C1(n2442), .Y(n1322) );
  AOI22_X1M_A9TH U2840 ( .A0(regs_receiver_fifo_rx_top[2]), .A1(n2442), .B0(
        n2441), .B1(n2440), .Y(n1321) );
  AOI22_X1M_A9TH U2842 ( .A0(regs_receiver_fifo_rx_top[1]), .A1(n2447), .B0(
        n2446), .B1(n2445), .Y(n1320) );
  AO22_X1M_A9TH U2843 ( .A0(n2449), .A1(regs_receiver_rf_data_in[3]), .B0(
        n2448), .B1(regs_receiver_rshift[0]), .Y(n1319) );
  AO22_X1M_A9TH U2844 ( .A0(n2449), .A1(regs_receiver_rf_data_in[4]), .B0(
        n2448), .B1(regs_receiver_rshift[1]), .Y(n1318) );
  AO22_X1M_A9TH U2845 ( .A0(n2449), .A1(regs_receiver_rf_data_in[5]), .B0(
        n2448), .B1(regs_receiver_rshift[2]), .Y(n1317) );
  AO22_X1M_A9TH U2846 ( .A0(n2449), .A1(regs_receiver_rf_data_in[6]), .B0(
        n2448), .B1(regs_receiver_rshift[3]), .Y(n1316) );
  AO22_X1M_A9TH U2847 ( .A0(n2449), .A1(regs_receiver_rf_data_in[7]), .B0(
        n2448), .B1(regs_receiver_rshift[4]), .Y(n1315) );
  AO22_X1M_A9TH U2848 ( .A0(n2449), .A1(regs_receiver_rf_data_in[8]), .B0(
        n2448), .B1(regs_receiver_rshift[5]), .Y(n1314) );
  AO22_X1M_A9TH U2849 ( .A0(n2449), .A1(regs_receiver_rf_data_in[9]), .B0(
        n2448), .B1(regs_receiver_rshift[6]), .Y(n1313) );
  AO22_X1M_A9TH U2850 ( .A0(n2449), .A1(regs_receiver_rf_data_in[10]), .B0(
        n2448), .B1(regs_receiver_rshift[7]), .Y(n1312) );
  AOI221_X1M_A9TH U2851 ( .A0(regs_tf_push), .A1(regs_transmitter_tf_pop), 
        .B0(n2450), .B1(regs_transmitter_tf_pop), .C0(regs_tx_reset), .Y(n2454) );
  NAND2_X1M_A9TH U2852 ( .A(n2466), .B(n2451), .Y(n2452) );
  AOI22_X1M_A9TH U2853 ( .A0(regs_transmitter_fifo_tx_bottom[0]), .A1(n2451), 
        .B0(n2452), .B1(n2455), .Y(n1311) );
  AOI21_X1M_A9TH U2855 ( .A0(n2455), .A1(n2466), .B0(n2454), .Y(n2464) );
  OA21_X1M_A9TH U2856 ( .A0(regs_transmitter_fifo_tx_bottom[1]), .A1(
        regs_tx_reset), .B0(n2464), .Y(n2461) );
  OAI222_X1M_A9TH U2857 ( .A0(n2463), .A1(n2458), .B0(n2457), .B1(
        regs_tx_reset), .C0(n2456), .C1(n2461), .Y(n1310) );
  OAI22_X1M_A9TH U2858 ( .A0(n2461), .A1(n2460), .B0(n2459), .B1(n2463), .Y(
        n1309) );
  AOI22_X1M_A9TH U2859 ( .A0(regs_transmitter_fifo_tx_bottom[1]), .A1(n2464), 
        .B0(n2463), .B1(n2462), .Y(n1308) );
  AOI221_X1M_A9TH U2860 ( .A0(regs_transmitter_tf_pop), .A1(regs_tf_push), 
        .B0(n2465), .B1(regs_tf_push), .C0(regs_tx_reset), .Y(n2467) );
  AOI21_X1M_A9TH U2861 ( .A0(n2466), .A1(n2479), .B0(n2467), .Y(n2471) );
  AOI21_X1M_A9TH U2862 ( .A0(n2467), .A1(n2479), .B0(n2471), .Y(n1307) );
  NAND2_X1M_A9TH U2863 ( .A(regs_transmitter_fifo_tx_top[2]), .B(n2472), .Y(
        n2491) );
  NAND3B_X1M_A9TH U2864 ( .AN(n2467), .B(n2466), .C(
        regs_transmitter_fifo_tx_top[0]), .Y(n2470) );
  NAND2_X1M_A9TH U2866 ( .A(regs_transmitter_fifo_tx_top[3]), .B(n2473), .Y(
        n2501) );
  OA21_X1M_A9TH U2867 ( .A0(regs_tx_reset), .A1(
        regs_transmitter_fifo_tx_top[1]), .B0(n2471), .Y(n2469) );
  OAI222_X1M_A9TH U2868 ( .A0(n2491), .A1(n2468), .B0(n2501), .B1(
        regs_tx_reset), .C0(n2472), .C1(n2469), .Y(n1306) );
  AOI22_X1M_A9TH U2869 ( .A0(regs_transmitter_fifo_tx_top[2]), .A1(n2469), 
        .B0(n2468), .B1(n2473), .Y(n1305) );
  AOI22_X1M_A9TH U2870 ( .A0(regs_transmitter_fifo_tx_top[1]), .A1(n2471), 
        .B0(n2470), .B1(n2476), .Y(n1304) );
  NAND3_X1M_A9TH U2871 ( .A(regs_tf_push), .B(n2476), .C(n2479), .Y(n2504) );
  NAND2_X1M_A9TH U2872 ( .A(n2473), .B(n2472), .Y(n2482) );
  NAND3_X1M_A9TH U2882 ( .A(regs_tf_push), .B(regs_transmitter_fifo_tx_top[0]), 
        .C(n2476), .Y(n2507) );
  NOR2_X1A_A9TH U2883 ( .A(n2482), .B(n2507), .Y(n2477) );
  NAND3_X1M_A9TH U2892 ( .A(regs_transmitter_fifo_tx_top[1]), .B(regs_tf_push), 
        .C(n2479), .Y(n2510) );
  NOR2_X1A_A9TH U2893 ( .A(n2482), .B(n2510), .Y(n2480) );
  NOR2_X1A_A9TH U2902 ( .A(n2500), .B(n2482), .Y(n2483) );
  NOR2_X1A_A9TH U2911 ( .A(n2491), .B(n2504), .Y(n2485) );
  NOR2_X1A_A9TH U2920 ( .A(n2491), .B(n2507), .Y(n2487) );
  NOR2_X1A_A9TH U2929 ( .A(n2491), .B(n2510), .Y(n2489) );
  NOR2_X1A_A9TH U2938 ( .A(n2491), .B(n2500), .Y(n2492) );
  NOR2_X1A_A9TH U2947 ( .A(n2501), .B(n2504), .Y(n2494) );
  NOR2_X1A_A9TH U2956 ( .A(n2501), .B(n2507), .Y(n2496) );
  NOR2_X1A_A9TH U2965 ( .A(n2501), .B(n2510), .Y(n2498) );
  NOR2_X1A_A9TH U2974 ( .A(n2501), .B(n2500), .Y(n2502) );
  NOR2_X1A_A9TH U2983 ( .A(n2511), .B(n2504), .Y(n2505) );
  NOR2_X1A_A9TH U2992 ( .A(n2511), .B(n2507), .Y(n2508) );
  NOR2_X1A_A9TH U3001 ( .A(n2511), .B(n2510), .Y(n2512) );
  NAND2_X1M_A9TH U3017 ( .A(regs_enable), .B(n2516), .Y(n2521) );
  NAND2_X1M_A9TH U3018 ( .A(n2536), .B(n2537), .Y(n2535) );
  NOR2_X1A_A9TH U3020 ( .A(n2517), .B(n2533), .Y(n2519) );
  NOR3_X1M_A9TH U3021 ( .A(regs_transmitter_counter[0]), .B(n2520), .C(n2521), 
        .Y(n2526) );
  NAND2_X1M_A9TH U3022 ( .A(n2526), .B(n2527), .Y(n2518) );
  AO22_X1M_A9TH U3023 ( .A0(regs_lcr[2]), .A1(n2519), .B0(
        regs_transmitter_counter[4]), .B1(n2518), .Y(n1176) );
  NOR2_X1A_A9TH U3024 ( .A(regs_transmitter_counter[0]), .B(n2520), .Y(n2523)
         );
  NOR2_X1A_A9TH U3025 ( .A(n2522), .B(n2521), .Y(n2531) );
  NAND2_X1M_A9TH U3026 ( .A(n2523), .B(n2531), .Y(n2529) );
  AO21_X1M_A9TH U3027 ( .A0(n2534), .A1(n2524), .B0(n2533), .Y(n2525) );
  OAI221_X1M_A9TH U3028 ( .A0(regs_transmitter_counter[3]), .A1(n2529), .B0(
        n2527), .B1(n2526), .C0(n2525), .Y(n1175) );
  OAI21_X1M_A9TH U3029 ( .A0(regs_transmitter_counter[1]), .A1(n2535), .B0(
        regs_transmitter_counter[2]), .Y(n2528) );
  AOI32_X1M_A9TH U3031 ( .A0(n2531), .A1(n2530), .A2(n2536), .B0(
        regs_transmitter_counter[1]), .B1(n2535), .Y(n2532) );
  OAI21_X1M_A9TH U3032 ( .A0(n2534), .A1(n2533), .B0(n2532), .Y(n1173) );
  OAI21_X1M_A9TH U3033 ( .A0(n2537), .A1(n2536), .B0(n2535), .Y(n1172) );
  NAND2_X1M_A9TH U3034 ( .A(n2547), .B(n2538), .Y(n2569) );
  NOR2_X1A_A9TH U3035 ( .A(n2548), .B(n2569), .Y(n2539) );
  NAND2_X1M_A9TH U3044 ( .A(n2547), .B(n2541), .Y(n2572) );
  NOR2_X1A_A9TH U3045 ( .A(n2548), .B(n2572), .Y(n2542) );
  NOR2_X1A_A9TH U3055 ( .A(n2548), .B(n2575), .Y(n2545) );
  NAND3_X1M_A9TH U3064 ( .A(n2547), .B(regs_receiver_fifo_rx_top[1]), .C(
        regs_receiver_fifo_rx_top[0]), .Y(n2578) );
  NOR2_X1A_A9TH U3065 ( .A(n2548), .B(n2578), .Y(n2549) );
  NOR2_X1A_A9TH U3083 ( .A(n2557), .B(n2572), .Y(n2553) );
  NOR2_X1A_A9TH U3101 ( .A(n2557), .B(n2578), .Y(n2558) );
  NOR2_X1A_A9TH U3110 ( .A(n2566), .B(n2569), .Y(n2560) );
  NOR2_X1A_A9TH U3119 ( .A(n2566), .B(n2572), .Y(n2562) );
  NOR2_X1A_A9TH U3128 ( .A(n2566), .B(n2575), .Y(n2564) );
  NOR2_X1A_A9TH U3137 ( .A(n2566), .B(n2578), .Y(n2567) );
  NOR2_X1A_A9TH U3146 ( .A(n2579), .B(n2569), .Y(n2570) );
  NOR2_X1A_A9TH U3155 ( .A(n2579), .B(n2572), .Y(n2573) );
  NOR2_X1A_A9TH U3164 ( .A(n2579), .B(n2575), .Y(n2576) );
  NOR2_X1A_A9TH U3173 ( .A(n2579), .B(n2578), .Y(n2580) );
  NAND2XB_X1M_A9TH U3182 ( .BN(n2596), .A(n2582), .Y(n2584) );
  OA22_X1M_A9TH U3183 ( .A0(n2584), .A1(wb_dat8_i[0]), .B0(regs_scratch[0]), 
        .B1(n2583), .Y(n1043) );
  OA22_X1M_A9TH U3184 ( .A0(n2584), .A1(wb_dat8_i[1]), .B0(regs_scratch[1]), 
        .B1(n2583), .Y(n1042) );
  OA22_X1M_A9TH U3185 ( .A0(n2584), .A1(wb_dat8_i[2]), .B0(regs_scratch[2]), 
        .B1(n2583), .Y(n1041) );
  OA22_X1M_A9TH U3186 ( .A0(n2584), .A1(wb_dat8_i[3]), .B0(regs_scratch[3]), 
        .B1(n2583), .Y(n1040) );
  OA22_X1M_A9TH U3187 ( .A0(n2584), .A1(wb_dat8_i[4]), .B0(regs_scratch[4]), 
        .B1(n2583), .Y(n1039) );
  OA22_X1M_A9TH U3188 ( .A0(n2584), .A1(wb_dat8_i[5]), .B0(regs_scratch[5]), 
        .B1(n2583), .Y(n1038) );
  OA22_X1M_A9TH U3189 ( .A0(n2584), .A1(wb_dat8_i[6]), .B0(regs_scratch[6]), 
        .B1(n2583), .Y(n1037) );
  OA22_X1M_A9TH U3190 ( .A0(n2584), .A1(wb_dat8_i[7]), .B0(regs_scratch[7]), 
        .B1(n2583), .Y(n1036) );
  NAND2_X1M_A9TH U3191 ( .A(wb_adr_int[2]), .B(n2585), .Y(n2586) );
  NOR3_X1M_A9TH U3192 ( .A(wb_adr_int[0]), .B(n2596), .C(n2586), .Y(n2594) );
  AOI22_X1M_A9TH U3193 ( .A0(n2594), .A1(n2612), .B0(n2587), .B1(n2591), .Y(
        n1035) );
  AOI22_X1M_A9TH U3194 ( .A0(n2594), .A1(n2615), .B0(n2588), .B1(n2591), .Y(
        n1034) );
  AOI22_X1M_A9TH U3195 ( .A0(n2594), .A1(n2598), .B0(n2589), .B1(n2591), .Y(
        n1033) );
  AOI22_X1M_A9TH U3196 ( .A0(n2594), .A1(n2600), .B0(n2590), .B1(n2591), .Y(
        n1032) );
  AOI22_X1M_A9TH U3197 ( .A0(n2594), .A1(n2593), .B0(n2592), .B1(n2591), .Y(
        n1031) );
  AOI22_X1M_A9TH U3199 ( .A0(n2616), .A1(n2598), .B0(n2597), .B1(n2613), .Y(
        n1030) );
  AOI22_X1M_A9TH U3200 ( .A0(n2616), .A1(n2600), .B0(n2599), .B1(n2613), .Y(
        n1029) );
  OA22_X1M_A9TH U3201 ( .A0(n2613), .A1(wb_dat8_i[4]), .B0(regs_lcr[4]), .B1(
        n2616), .Y(n1028) );
  AOI22_X1M_A9TH U3202 ( .A0(n2616), .A1(n2602), .B0(n2601), .B1(n2613), .Y(
        n1027) );
  AOI22_X1M_A9TH U3203 ( .A0(n2616), .A1(n2606), .B0(n2603), .B1(n2613), .Y(
        n1026) );
  AOI22_X1M_A9TH U3204 ( .A0(n2616), .A1(n2609), .B0(n2604), .B1(n2613), .Y(
        n1025) );
  AOI22_X1M_A9TH U3205 ( .A0(n2610), .A1(n2606), .B0(n2605), .B1(n2607), .Y(
        n1024) );
  AOI22_X1M_A9TH U3206 ( .A0(n2610), .A1(n2609), .B0(n2608), .B1(n2607), .Y(
        n1023) );
  AOI22_X1M_A9TH U3207 ( .A0(n2616), .A1(n2612), .B0(n2611), .B1(n2613), .Y(
        n1022) );
  AOI22_X1M_A9TH U3208 ( .A0(n2616), .A1(n2615), .B0(n2614), .B1(n2613), .Y(
        n1021) );
  INV_X1B_A9TH U1548 ( .A(n2617), .Y(n1847) );
  NOR2B_X1M_A9TH U1812 ( .AN(n1855), .B(n2618), .Y(regs_N364) );
  AOI22_X1M_A9TH U1813 ( .A0(regs_ier[3]), .A1(regs_ms_int_pnd), .B0(
        regs_ms_int), .B1(n1639), .Y(n2618) );
  AOI2XB1_X1M_A9TH U1815 ( .A1N(n2444), .A0(n2544), .B0(n2447), .Y(n1323) );
  XOR2_X1M_A9TH U1819 ( .A(n2620), .B(n2619), .Y(regs_N223) );
  OAI21_X1M_A9TH U1951 ( .A0(n1564), .A1(n1614), .B0(n1545), .Y(n2619) );
  INV_X1B_A9TH U1983 ( .A(dsr_pad_i), .Y(n1483) );
  AOI211_X1M_A9TH U2041 ( .A0(regs_delayed_modem_signals[1]), .A1(dsr_pad_i), 
        .B0(regs_msr[1]), .C0(n2621), .Y(n1701) );
  NOR2_X1A_A9TH U2052 ( .A(regs_delayed_modem_signals[1]), .B(dsr_pad_i), .Y(
        n2621) );
  INV_X1B_A9TH U2053 ( .A(cts_pad_i), .Y(n1482) );
  AOI211_X1M_A9TH U2132 ( .A0(regs_delayed_modem_signals[0]), .A1(cts_pad_i), 
        .B0(regs_msr[0]), .C0(n2622), .Y(n1699) );
  NOR2_X1A_A9TH U2133 ( .A(regs_delayed_modem_signals[0]), .B(cts_pad_i), .Y(
        n2622) );
  INV_X1B_A9TH U2135 ( .A(dcd_pad_i), .Y(n1485) );
  AOI211_X1M_A9TH U2136 ( .A0(regs_delayed_modem_signals[3]), .A1(dcd_pad_i), 
        .B0(regs_msr[3]), .C0(n2623), .Y(n1705) );
  NOR2_X1A_A9TH U2138 ( .A(regs_delayed_modem_signals[3]), .B(dcd_pad_i), .Y(
        n2623) );
  INV_X1B_A9TH U2139 ( .A(ri_pad_i), .Y(n1484) );
  AOI211_X1M_A9TH U2141 ( .A0(regs_delayed_modem_signals[2]), .A1(ri_pad_i), 
        .B0(regs_msr[2]), .C0(n2624), .Y(n1703) );
  NOR2_X1A_A9TH U2142 ( .A(regs_delayed_modem_signals[2]), .B(ri_pad_i), .Y(
        n2624) );
  AOI21B_X1M_A9TH U2274 ( .A0(n2611), .A1(n2089), .B0N(n2087), .Y(n2090) );
  NOR2B_X1M_A9TH U2275 ( .AN(n2170), .B(regs_receiver_rframing_error), .Y(
        n2142) );
  NOR2_X1A_A9TH U2489 ( .A(n2179), .B(n2224), .Y(n2170) );
  NOR2XB_X3M_A9TH U2508 ( .BN(n1628), .A(regs_start_dlc), .Y(n1564) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_15__7_ ( .D(
        wb_dat8_i[7]), .E(n2514), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[127]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_15__6_ ( .D(
        wb_dat8_i[6]), .E(n2514), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[126]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_15__5_ ( .D(
        wb_dat8_i[5]), .E(n2514), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[125]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_15__3_ ( .D(
        wb_dat8_i[3]), .E(n2514), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[123]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_15__2_ ( .D(
        wb_dat8_i[2]), .E(n2514), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[122]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_15__1_ ( .D(
        wb_dat8_i[1]), .E(n2514), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[121]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_15__0_ ( .D(
        wb_dat8_i[0]), .E(n2514), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[120]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_3__7_ ( .D(
        wb_dat8_i[7]), .E(n2483), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[31]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_3__6_ ( .D(
        wb_dat8_i[6]), .E(n2483), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[30]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_3__5_ ( .D(
        wb_dat8_i[5]), .E(n2483), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[29]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_3__3_ ( .D(
        wb_dat8_i[3]), .E(n2483), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[27]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_3__2_ ( .D(
        wb_dat8_i[2]), .E(n2483), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[26]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_3__1_ ( .D(
        wb_dat8_i[1]), .E(n2483), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[25]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_3__0_ ( .D(
        wb_dat8_i[0]), .E(n2483), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[24]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_15__4_ ( .D(
        wb_dat8_i[4]), .E(n2514), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[124]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_3__4_ ( .D(
        wb_dat8_i[4]), .E(n2483), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[28]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_11__7_ ( .D(
        wb_dat8_i[7]), .E(n2502), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[95]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_11__6_ ( .D(
        wb_dat8_i[6]), .E(n2502), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[94]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_11__5_ ( .D(
        wb_dat8_i[5]), .E(n2502), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[93]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_11__3_ ( .D(
        wb_dat8_i[3]), .E(n2502), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[91]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_11__2_ ( .D(
        wb_dat8_i[2]), .E(n2502), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[90]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_11__1_ ( .D(
        wb_dat8_i[1]), .E(n2502), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[89]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_11__0_ ( .D(
        wb_dat8_i[0]), .E(n2502), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[88]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_7__7_ ( .D(
        wb_dat8_i[7]), .E(n2492), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[63]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_7__6_ ( .D(
        wb_dat8_i[6]), .E(n2492), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[62]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_7__5_ ( .D(
        wb_dat8_i[5]), .E(n2492), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[61]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_7__3_ ( .D(
        wb_dat8_i[3]), .E(n2492), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[59]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_7__2_ ( .D(
        wb_dat8_i[2]), .E(n2492), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[58]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_7__1_ ( .D(
        wb_dat8_i[1]), .E(n2492), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[57]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_7__0_ ( .D(
        wb_dat8_i[0]), .E(n2492), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[56]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_11__4_ ( .D(
        wb_dat8_i[4]), .E(n2502), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[92]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_7__4_ ( .D(
        wb_dat8_i[4]), .E(n2492), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[60]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_0__7_ ( .D(
        wb_dat8_i[7]), .E(n2474), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[7]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_0__6_ ( .D(
        wb_dat8_i[6]), .E(n2474), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[6]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_0__5_ ( .D(
        wb_dat8_i[5]), .E(n2474), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[5]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_0__3_ ( .D(
        wb_dat8_i[3]), .E(n2474), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[3]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_0__2_ ( .D(
        wb_dat8_i[2]), .E(n2474), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[2]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_0__1_ ( .D(
        wb_dat8_i[1]), .E(n2474), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[1]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_0__0_ ( .D(
        wb_dat8_i[0]), .E(n2474), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[0]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_0__4_ ( .D(
        wb_dat8_i[4]), .E(n2474), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[4]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_2__7_ ( .D(
        wb_dat8_i[7]), .E(n2480), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[23]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_2__6_ ( .D(
        wb_dat8_i[6]), .E(n2480), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[22]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_2__5_ ( .D(
        wb_dat8_i[5]), .E(n2480), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[21]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_2__3_ ( .D(
        wb_dat8_i[3]), .E(n2480), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[19]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_2__2_ ( .D(
        wb_dat8_i[2]), .E(n2480), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[18]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_2__1_ ( .D(
        wb_dat8_i[1]), .E(n2480), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[17]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_2__0_ ( .D(
        wb_dat8_i[0]), .E(n2480), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[16]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_14__7_ ( .D(
        wb_dat8_i[7]), .E(n2512), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[119]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_14__6_ ( .D(
        wb_dat8_i[6]), .E(n2512), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[118]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_14__5_ ( .D(
        wb_dat8_i[5]), .E(n2512), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[117]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_14__3_ ( .D(
        wb_dat8_i[3]), .E(n2512), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[115]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_14__2_ ( .D(
        wb_dat8_i[2]), .E(n2512), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[114]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_14__1_ ( .D(
        wb_dat8_i[1]), .E(n2512), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[113]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_14__0_ ( .D(
        wb_dat8_i[0]), .E(n2512), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[112]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_2__4_ ( .D(
        wb_dat8_i[4]), .E(n2480), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[20]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_14__4_ ( .D(
        wb_dat8_i[4]), .E(n2512), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[116]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_10__7_ ( .D(
        wb_dat8_i[7]), .E(n2498), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[87]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_10__6_ ( .D(
        wb_dat8_i[6]), .E(n2498), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[86]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_10__5_ ( .D(
        wb_dat8_i[5]), .E(n2498), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[85]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_10__3_ ( .D(
        wb_dat8_i[3]), .E(n2498), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[83]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_10__2_ ( .D(
        wb_dat8_i[2]), .E(n2498), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[82]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_10__1_ ( .D(
        wb_dat8_i[1]), .E(n2498), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[81]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_10__0_ ( .D(
        wb_dat8_i[0]), .E(n2498), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[80]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_6__7_ ( .D(
        wb_dat8_i[7]), .E(n2489), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[55]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_6__6_ ( .D(
        wb_dat8_i[6]), .E(n2489), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[54]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_6__5_ ( .D(
        wb_dat8_i[5]), .E(n2489), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[53]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_6__3_ ( .D(
        wb_dat8_i[3]), .E(n2489), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[51]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_6__2_ ( .D(
        wb_dat8_i[2]), .E(n2489), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[50]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_6__1_ ( .D(
        wb_dat8_i[1]), .E(n2489), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[49]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_6__0_ ( .D(
        wb_dat8_i[0]), .E(n2489), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[48]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_10__4_ ( .D(
        wb_dat8_i[4]), .E(n2498), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[84]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_6__4_ ( .D(
        wb_dat8_i[4]), .E(n2489), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[52]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_12__7_ ( .D(
        wb_dat8_i[7]), .E(n2505), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[103]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_12__6_ ( .D(
        wb_dat8_i[6]), .E(n2505), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[102]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_12__5_ ( .D(
        wb_dat8_i[5]), .E(n2505), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[101]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_12__3_ ( .D(
        wb_dat8_i[3]), .E(n2505), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[99]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_12__2_ ( .D(
        wb_dat8_i[2]), .E(n2505), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[98]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_12__1_ ( .D(
        wb_dat8_i[1]), .E(n2505), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[97]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_12__0_ ( .D(
        wb_dat8_i[0]), .E(n2505), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[96]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_12__4_ ( .D(
        wb_dat8_i[4]), .E(n2505), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[100]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_8__7_ ( .D(
        wb_dat8_i[7]), .E(n2494), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[71]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_8__6_ ( .D(
        wb_dat8_i[6]), .E(n2494), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[70]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_8__5_ ( .D(
        wb_dat8_i[5]), .E(n2494), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[69]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_8__3_ ( .D(
        wb_dat8_i[3]), .E(n2494), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[67]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_8__2_ ( .D(
        wb_dat8_i[2]), .E(n2494), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[66]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_8__1_ ( .D(
        wb_dat8_i[1]), .E(n2494), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[65]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_8__0_ ( .D(
        wb_dat8_i[0]), .E(n2494), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[64]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_4__7_ ( .D(
        wb_dat8_i[7]), .E(n2485), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[39]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_4__6_ ( .D(
        wb_dat8_i[6]), .E(n2485), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[38]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_4__5_ ( .D(
        wb_dat8_i[5]), .E(n2485), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[37]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_4__3_ ( .D(
        wb_dat8_i[3]), .E(n2485), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[35]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_4__2_ ( .D(
        wb_dat8_i[2]), .E(n2485), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[34]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_4__1_ ( .D(
        wb_dat8_i[1]), .E(n2485), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[33]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_4__0_ ( .D(
        wb_dat8_i[0]), .E(n2485), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[32]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_8__4_ ( .D(
        wb_dat8_i[4]), .E(n2494), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[68]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_4__4_ ( .D(
        wb_dat8_i[4]), .E(n2485), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[36]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_1__7_ ( .D(
        wb_dat8_i[7]), .E(n2477), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[15]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_1__6_ ( .D(
        wb_dat8_i[6]), .E(n2477), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[14]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_1__5_ ( .D(
        wb_dat8_i[5]), .E(n2477), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[13]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_1__3_ ( .D(
        wb_dat8_i[3]), .E(n2477), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[11]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_1__2_ ( .D(
        wb_dat8_i[2]), .E(n2477), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[10]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_1__1_ ( .D(
        wb_dat8_i[1]), .E(n2477), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[9]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_1__0_ ( .D(
        wb_dat8_i[0]), .E(n2477), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[8]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_13__7_ ( .D(
        wb_dat8_i[7]), .E(n2508), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[111]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_13__6_ ( .D(
        wb_dat8_i[6]), .E(n2508), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[110]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_13__5_ ( .D(
        wb_dat8_i[5]), .E(n2508), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[109]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_13__3_ ( .D(
        wb_dat8_i[3]), .E(n2508), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[107]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_13__2_ ( .D(
        wb_dat8_i[2]), .E(n2508), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[106]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_13__1_ ( .D(
        wb_dat8_i[1]), .E(n2508), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[105]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_13__0_ ( .D(
        wb_dat8_i[0]), .E(n2508), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[104]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_1__4_ ( .D(
        wb_dat8_i[4]), .E(n2477), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[12]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_13__4_ ( .D(
        wb_dat8_i[4]), .E(n2508), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[108]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_9__7_ ( .D(
        wb_dat8_i[7]), .E(n2496), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[79]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_9__6_ ( .D(
        wb_dat8_i[6]), .E(n2496), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[78]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_9__5_ ( .D(
        wb_dat8_i[5]), .E(n2496), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[77]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_9__3_ ( .D(
        wb_dat8_i[3]), .E(n2496), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[75]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_9__2_ ( .D(
        wb_dat8_i[2]), .E(n2496), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[74]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_9__1_ ( .D(
        wb_dat8_i[1]), .E(n2496), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[73]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_9__0_ ( .D(
        wb_dat8_i[0]), .E(n2496), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[72]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_5__7_ ( .D(
        wb_dat8_i[7]), .E(n2487), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[47]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_5__6_ ( .D(
        wb_dat8_i[6]), .E(n2487), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[46]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_5__5_ ( .D(
        wb_dat8_i[5]), .E(n2487), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[45]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_5__3_ ( .D(
        wb_dat8_i[3]), .E(n2487), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[43]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_5__2_ ( .D(
        wb_dat8_i[2]), .E(n2487), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[42]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_5__1_ ( .D(
        wb_dat8_i[1]), .E(n2487), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[41]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_5__0_ ( .D(
        wb_dat8_i[0]), .E(n2487), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[40]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_9__4_ ( .D(
        wb_dat8_i[4]), .E(n2496), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[76]) );
  EDFFQ_X1M_A9TH regs_transmitter_fifo_tx_tfifo_ram_reg_5__4_ ( .D(
        wb_dat8_i[4]), .E(n2487), .CK(wb_clk_i), .Q(
        regs_transmitter_fifo_tx_tfifo_ram[44]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_12__7_ ( .D(
        regs_receiver_rf_data_in[10]), .E(n2570), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[103]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_12__6_ ( .D(
        regs_receiver_rf_data_in[9]), .E(n2570), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[102]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_12__5_ ( .D(
        regs_receiver_rf_data_in[8]), .E(n2570), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[101]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_12__4_ ( .D(
        regs_receiver_rf_data_in[7]), .E(n2570), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[100]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_12__3_ ( .D(
        regs_receiver_rf_data_in[6]), .E(n2570), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[99]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_12__2_ ( .D(
        regs_receiver_rf_data_in[5]), .E(n2570), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[98]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_12__1_ ( .D(
        regs_receiver_rf_data_in[4]), .E(n2570), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[97]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_12__0_ ( .D(
        regs_receiver_rf_data_in[3]), .E(n2570), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[96]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_0__7_ ( .D(
        regs_receiver_rf_data_in[10]), .E(n2539), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[7]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_0__6_ ( .D(
        regs_receiver_rf_data_in[9]), .E(n2539), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[6]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_0__5_ ( .D(
        regs_receiver_rf_data_in[8]), .E(n2539), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[5]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_0__4_ ( .D(
        regs_receiver_rf_data_in[7]), .E(n2539), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[4]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_0__3_ ( .D(
        regs_receiver_rf_data_in[6]), .E(n2539), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[3]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_0__2_ ( .D(
        regs_receiver_rf_data_in[5]), .E(n2539), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[2]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_0__1_ ( .D(
        regs_receiver_rf_data_in[4]), .E(n2539), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[1]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_0__0_ ( .D(
        regs_receiver_rf_data_in[3]), .E(n2539), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[0]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_8__7_ ( .D(
        regs_receiver_rf_data_in[10]), .E(n2560), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[71]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_8__6_ ( .D(
        regs_receiver_rf_data_in[9]), .E(n2560), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[70]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_8__5_ ( .D(
        regs_receiver_rf_data_in[8]), .E(n2560), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[69]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_8__4_ ( .D(
        regs_receiver_rf_data_in[7]), .E(n2560), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[68]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_8__3_ ( .D(
        regs_receiver_rf_data_in[6]), .E(n2560), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[67]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_8__2_ ( .D(
        regs_receiver_rf_data_in[5]), .E(n2560), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[66]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_8__1_ ( .D(
        regs_receiver_rf_data_in[4]), .E(n2560), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[65]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_8__0_ ( .D(
        regs_receiver_rf_data_in[3]), .E(n2560), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[64]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_4__7_ ( .D(
        regs_receiver_rf_data_in[10]), .E(n2551), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[39]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_4__6_ ( .D(
        regs_receiver_rf_data_in[9]), .E(n2551), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[38]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_4__5_ ( .D(
        regs_receiver_rf_data_in[8]), .E(n2551), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[37]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_4__4_ ( .D(
        regs_receiver_rf_data_in[7]), .E(n2551), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[36]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_4__3_ ( .D(
        regs_receiver_rf_data_in[6]), .E(n2551), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[35]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_4__2_ ( .D(
        regs_receiver_rf_data_in[5]), .E(n2551), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[34]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_4__1_ ( .D(
        regs_receiver_rf_data_in[4]), .E(n2551), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[33]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_4__0_ ( .D(
        regs_receiver_rf_data_in[3]), .E(n2551), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[32]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_13__7_ ( .D(
        regs_receiver_rf_data_in[10]), .E(n2573), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[111]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_13__6_ ( .D(
        regs_receiver_rf_data_in[9]), .E(n2573), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[110]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_13__5_ ( .D(
        regs_receiver_rf_data_in[8]), .E(n2573), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[109]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_13__4_ ( .D(
        regs_receiver_rf_data_in[7]), .E(n2573), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[108]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_13__3_ ( .D(
        regs_receiver_rf_data_in[6]), .E(n2573), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[107]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_13__2_ ( .D(
        regs_receiver_rf_data_in[5]), .E(n2573), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[106]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_13__1_ ( .D(
        regs_receiver_rf_data_in[4]), .E(n2573), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[105]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_13__0_ ( .D(
        regs_receiver_rf_data_in[3]), .E(n2573), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[104]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_1__7_ ( .D(
        regs_receiver_rf_data_in[10]), .E(n2542), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[15]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_1__6_ ( .D(
        regs_receiver_rf_data_in[9]), .E(n2542), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[14]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_1__5_ ( .D(
        regs_receiver_rf_data_in[8]), .E(n2542), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[13]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_1__4_ ( .D(
        regs_receiver_rf_data_in[7]), .E(n2542), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[12]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_1__3_ ( .D(
        regs_receiver_rf_data_in[6]), .E(n2542), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[11]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_1__2_ ( .D(
        regs_receiver_rf_data_in[5]), .E(n2542), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[10]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_1__1_ ( .D(
        regs_receiver_rf_data_in[4]), .E(n2542), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[9]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_1__0_ ( .D(
        regs_receiver_rf_data_in[3]), .E(n2542), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[8]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_9__7_ ( .D(
        regs_receiver_rf_data_in[10]), .E(n2562), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[79]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_9__6_ ( .D(
        regs_receiver_rf_data_in[9]), .E(n2562), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[78]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_9__5_ ( .D(
        regs_receiver_rf_data_in[8]), .E(n2562), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[77]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_9__4_ ( .D(
        regs_receiver_rf_data_in[7]), .E(n2562), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[76]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_9__3_ ( .D(
        regs_receiver_rf_data_in[6]), .E(n2562), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[75]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_9__2_ ( .D(
        regs_receiver_rf_data_in[5]), .E(n2562), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[74]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_9__1_ ( .D(
        regs_receiver_rf_data_in[4]), .E(n2562), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[73]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_9__0_ ( .D(
        regs_receiver_rf_data_in[3]), .E(n2562), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[72]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_5__7_ ( .D(
        regs_receiver_rf_data_in[10]), .E(n2553), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[47]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_5__6_ ( .D(
        regs_receiver_rf_data_in[9]), .E(n2553), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[46]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_5__5_ ( .D(
        regs_receiver_rf_data_in[8]), .E(n2553), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[45]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_5__4_ ( .D(
        regs_receiver_rf_data_in[7]), .E(n2553), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[44]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_5__3_ ( .D(
        regs_receiver_rf_data_in[6]), .E(n2553), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[43]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_5__2_ ( .D(
        regs_receiver_rf_data_in[5]), .E(n2553), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[42]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_5__1_ ( .D(
        regs_receiver_rf_data_in[4]), .E(n2553), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[41]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_5__0_ ( .D(
        regs_receiver_rf_data_in[3]), .E(n2553), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[40]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_15__7_ ( .D(
        regs_receiver_rf_data_in[10]), .E(n2580), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[127]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_15__6_ ( .D(
        regs_receiver_rf_data_in[9]), .E(n2580), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[126]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_15__5_ ( .D(
        regs_receiver_rf_data_in[8]), .E(n2580), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[125]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_15__4_ ( .D(
        regs_receiver_rf_data_in[7]), .E(n2580), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[124]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_15__3_ ( .D(
        regs_receiver_rf_data_in[6]), .E(n2580), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[123]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_15__2_ ( .D(
        regs_receiver_rf_data_in[5]), .E(n2580), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[122]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_15__1_ ( .D(
        regs_receiver_rf_data_in[4]), .E(n2580), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[121]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_15__0_ ( .D(
        regs_receiver_rf_data_in[3]), .E(n2580), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[120]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_3__7_ ( .D(
        regs_receiver_rf_data_in[10]), .E(n2549), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[31]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_3__6_ ( .D(
        regs_receiver_rf_data_in[9]), .E(n2549), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[30]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_3__5_ ( .D(
        regs_receiver_rf_data_in[8]), .E(n2549), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[29]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_3__4_ ( .D(
        regs_receiver_rf_data_in[7]), .E(n2549), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[28]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_3__3_ ( .D(
        regs_receiver_rf_data_in[6]), .E(n2549), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[27]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_3__2_ ( .D(
        regs_receiver_rf_data_in[5]), .E(n2549), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[26]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_3__1_ ( .D(
        regs_receiver_rf_data_in[4]), .E(n2549), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[25]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_3__0_ ( .D(
        regs_receiver_rf_data_in[3]), .E(n2549), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[24]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_11__7_ ( .D(
        regs_receiver_rf_data_in[10]), .E(n2567), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[95]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_11__6_ ( .D(
        regs_receiver_rf_data_in[9]), .E(n2567), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[94]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_11__5_ ( .D(
        regs_receiver_rf_data_in[8]), .E(n2567), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[93]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_11__4_ ( .D(
        regs_receiver_rf_data_in[7]), .E(n2567), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[92]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_11__3_ ( .D(
        regs_receiver_rf_data_in[6]), .E(n2567), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[91]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_11__2_ ( .D(
        regs_receiver_rf_data_in[5]), .E(n2567), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[90]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_11__1_ ( .D(
        regs_receiver_rf_data_in[4]), .E(n2567), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[89]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_11__0_ ( .D(
        regs_receiver_rf_data_in[3]), .E(n2567), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[88]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_7__7_ ( .D(
        regs_receiver_rf_data_in[10]), .E(n2558), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[63]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_7__6_ ( .D(
        regs_receiver_rf_data_in[9]), .E(n2558), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[62]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_7__5_ ( .D(
        regs_receiver_rf_data_in[8]), .E(n2558), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[61]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_7__4_ ( .D(
        regs_receiver_rf_data_in[7]), .E(n2558), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[60]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_7__3_ ( .D(
        regs_receiver_rf_data_in[6]), .E(n2558), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[59]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_7__2_ ( .D(
        regs_receiver_rf_data_in[5]), .E(n2558), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[58]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_7__1_ ( .D(
        regs_receiver_rf_data_in[4]), .E(n2558), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[57]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_7__0_ ( .D(
        regs_receiver_rf_data_in[3]), .E(n2558), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[56]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_14__7_ ( .D(
        regs_receiver_rf_data_in[10]), .E(n2576), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[119]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_14__6_ ( .D(
        regs_receiver_rf_data_in[9]), .E(n2576), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[118]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_14__5_ ( .D(
        regs_receiver_rf_data_in[8]), .E(n2576), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[117]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_14__4_ ( .D(
        regs_receiver_rf_data_in[7]), .E(n2576), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[116]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_14__3_ ( .D(
        regs_receiver_rf_data_in[6]), .E(n2576), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[115]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_14__2_ ( .D(
        regs_receiver_rf_data_in[5]), .E(n2576), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[114]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_14__1_ ( .D(
        regs_receiver_rf_data_in[4]), .E(n2576), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[113]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_14__0_ ( .D(
        regs_receiver_rf_data_in[3]), .E(n2576), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[112]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_2__7_ ( .D(
        regs_receiver_rf_data_in[10]), .E(n2545), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[23]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_2__6_ ( .D(
        regs_receiver_rf_data_in[9]), .E(n2545), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[22]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_2__5_ ( .D(
        regs_receiver_rf_data_in[8]), .E(n2545), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[21]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_2__4_ ( .D(
        regs_receiver_rf_data_in[7]), .E(n2545), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[20]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_2__3_ ( .D(
        regs_receiver_rf_data_in[6]), .E(n2545), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[19]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_2__2_ ( .D(
        regs_receiver_rf_data_in[5]), .E(n2545), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[18]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_2__1_ ( .D(
        regs_receiver_rf_data_in[4]), .E(n2545), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[17]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_2__0_ ( .D(
        regs_receiver_rf_data_in[3]), .E(n2545), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[16]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_10__7_ ( .D(
        regs_receiver_rf_data_in[10]), .E(n2564), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[87]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_10__6_ ( .D(
        regs_receiver_rf_data_in[9]), .E(n2564), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[86]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_10__5_ ( .D(
        regs_receiver_rf_data_in[8]), .E(n2564), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[85]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_10__4_ ( .D(
        regs_receiver_rf_data_in[7]), .E(n2564), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[84]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_10__3_ ( .D(
        regs_receiver_rf_data_in[6]), .E(n2564), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[83]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_10__2_ ( .D(
        regs_receiver_rf_data_in[5]), .E(n2564), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[82]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_10__1_ ( .D(
        regs_receiver_rf_data_in[4]), .E(n2564), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[81]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_10__0_ ( .D(
        regs_receiver_rf_data_in[3]), .E(n2564), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[80]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_6__7_ ( .D(
        regs_receiver_rf_data_in[10]), .E(n2555), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[55]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_6__6_ ( .D(
        regs_receiver_rf_data_in[9]), .E(n2555), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[54]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_6__5_ ( .D(
        regs_receiver_rf_data_in[8]), .E(n2555), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[53]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_6__4_ ( .D(
        regs_receiver_rf_data_in[7]), .E(n2555), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[52]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_6__3_ ( .D(
        regs_receiver_rf_data_in[6]), .E(n2555), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[51]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_6__2_ ( .D(
        regs_receiver_rf_data_in[5]), .E(n2555), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[50]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_6__1_ ( .D(
        regs_receiver_rf_data_in[4]), .E(n2555), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[49]) );
  EDFFQ_X1M_A9TH regs_receiver_fifo_rx_rfifo_ram_reg_6__0_ ( .D(
        regs_receiver_rf_data_in[3]), .E(n2555), .CK(wb_clk_i), .Q(
        regs_receiver_fifo_rx_rfifo_ram[48]) );
  DFFRPQN_X1M_A9TH regs_receiver_rf_push_q_reg ( .D(regs_receiver_rf_push), 
        .CK(wb_clk_i), .R(wb_rst_i), .QN(n2626) );
  DFFRPQN_X1M_A9TH regs_dl_reg_9_ ( .D(n1470), .CK(wb_clk_i), .R(wb_rst_i), 
        .QN(n2625) );
  NOR2_X1M_A9TH U1547 ( .A(regs_rstate[2]), .B(n2146), .Y(n2105) );
  NOR2_X1M_A9TH U1573 ( .A(n2462), .B(n2457), .Y(n1929) );
  NAND3_X1A_A9TH U1612 ( .A(regs_receiver_fifo_rx_top[1]), .B(
        regs_receiver_fifo_rx_top[0]), .C(n2444), .Y(n2334) );
  NOR2_X1M_A9TH U1613 ( .A(regs_rstate[3]), .B(n2144), .Y(n2146) );
  NOR2_X1M_A9TH U1614 ( .A(regs_transmitter_fifo_tx_bottom[3]), .B(n2459), .Y(
        n1926) );
  NAND3_X1A_A9TH U1615 ( .A(n2008), .B(n2010), .C(n2003), .Y(n1996) );
  NOR2_X1M_A9TH U1616 ( .A(regs_receiver_fifo_rx_top[1]), .B(n2544), .Y(n2541)
         );
  AO1B2_X1M_A9TH U1617 ( .B0(n2399), .B1(n2393), .A0N(n2387), .Y(n2389) );
  NAND3_X1A_A9TH U1618 ( .A(n1707), .B(wb_adr_int[0]), .C(wb_adr_int[1]), .Y(
        n2595) );
  NOR2_X1M_A9TH U1619 ( .A(n2334), .B(n2579), .Y(n2335) );
  NOR2_X1M_A9TH U1620 ( .A(n2318), .B(n2579), .Y(n2319) );
  NOR2_X1M_A9TH U1621 ( .A(n2318), .B(n2557), .Y(n2261) );
  NOR2_X1M_A9TH U1622 ( .A(n2428), .B(n1490), .Y(n2276) );
  NOR2_X1M_A9TH U1623 ( .A(regs_rf_count[1]), .B(n1659), .Y(n1661) );
  NOR2_X1M_A9TH U1624 ( .A(n2215), .B(n2104), .Y(n2175) );
  NOR2_X1M_A9TH U1625 ( .A(n2132), .B(n2119), .Y(n2117) );
  NOR2_X1M_A9TH U1626 ( .A(regs_rstate[2]), .B(n2144), .Y(n2136) );
  NAND2B_X1M_A9TH U1627 ( .AN(regs_transmitter_counter[2]), .B(n2530), .Y(
        n2520) );
  NOR2_X1M_A9TH U1628 ( .A(n1986), .B(n2000), .Y(n1987) );
  NOR2_X1M_A9TH U1629 ( .A(regs_tstate[1]), .B(n2021), .Y(n1946) );
  NOR2_X1M_A9TH U1630 ( .A(n2045), .B(n2055), .Y(n2058) );
  NOR2_X1M_A9TH U1631 ( .A(wb_interface_wb_we_is), .B(n1487), .Y(n1632) );
  NOR2_X1M_A9TH U1632 ( .A(n2604), .B(n1539), .Y(n1595) );
  NAND3_X1A_A9TH U1633 ( .A(regs_receiver_fifo_rx_top[1]), .B(n2547), .C(n2544), .Y(n2575) );
  NOR2_X1M_A9TH U1634 ( .A(n2596), .B(n2595), .Y(n2616) );
  NAND2B_X1M_A9TH U1635 ( .AN(n2393), .B(n2399), .Y(n2391) );
  NOR2_X1M_A9TH U1636 ( .A(regs_tstate[2]), .B(n2517), .Y(n2017) );
  NOR2_X1M_A9TH U1637 ( .A(regs_rda_int), .B(regs_rls_int_pnd), .Y(n1651) );
  NAND3_X1A_A9TH U1638 ( .A(regs_receiver_fifo_rx_top[0]), .B(n2444), .C(n2443), .Y(n2446) );
  NAND2B_X1M_A9TH U1639 ( .AN(n2428), .B(n2429), .Y(n2431) );
  NOR2_X1M_A9TH U1640 ( .A(regs_lsr_mask_d), .B(n1633), .Y(n2419) );
  NOR2_X1M_A9TH U1641 ( .A(regs_rx_reset), .B(n2360), .Y(n2365) );
  NAND3_X1A_A9TH U1642 ( .A(n2113), .B(n2175), .C(n2144), .Y(n2103) );
  NAND3_X1A_A9TH U1643 ( .A(n2132), .B(n2128), .C(n2599), .Y(n2216) );
  NOR2_X1M_A9TH U1783 ( .A(regs_receiver_counter_b[5]), .B(n2086), .Y(n2096)
         );
  NOR2_X1M_A9TH U1814 ( .A(n2215), .B(n2020), .Y(n1965) );
  NAND2B_X1M_A9TH U1821 ( .AN(n2470), .B(regs_transmitter_fifo_tx_top[1]), .Y(
        n2468) );
  NAND2B_X1M_A9TH U1823 ( .AN(n2452), .B(regs_transmitter_fifo_tx_bottom[0]), 
        .Y(n2463) );
  NOR2_X1M_A9TH U1825 ( .A(regs_tx_reset), .B(n2001), .Y(n2006) );
  NAND2B_X1M_A9TH U1828 ( .AN(n2535), .B(n2522), .Y(n2533) );
  NAND3_X1A_A9TH U1845 ( .A(n2041), .B(n2035), .C(n2036), .Y(n2043) );
  NAND2_X1M_A9TH U1848 ( .A(n1825), .B(n1656), .Y(n1855) );
  NOR2_X1M_A9TH U1864 ( .A(n2596), .B(n1848), .Y(n1854) );
  NAND2B_X1M_A9TH U1885 ( .AN(n1487), .B(wb_interface_wb_we_is), .Y(n2596) );
  NAND2B_X1M_A9TH U1896 ( .AN(n2596), .B(n1828), .Y(n2607) );
  NOR2_X1M_A9TH U1907 ( .A(n1568), .B(n1567), .Y(n2620) );
  NAND2_X1M_A9TH U1916 ( .A(wb_interface_wb_stb_is), .B(wb_interface_wb_cyc_is), .Y(n2617) );
  NOR2_X1M_A9TH U1919 ( .A(n2557), .B(n2575), .Y(n2555) );
  NOR2_X1M_A9TH U1931 ( .A(n2557), .B(n2569), .Y(n2551) );
  NOR2_X1M_A9TH U1933 ( .A(n2504), .B(n2482), .Y(n2474) );
  NOR2_X1M_A9TH U1935 ( .A(regs_N124), .B(n1643), .Y(regs_N167) );
  NAND3_X1A_A9TH U1982 ( .A(n1504), .B(n1503), .C(n1502), .Y(
        regs_rf_data_out[1]) );
  NAND3_X1A_A9TH U2043 ( .A(n1514), .B(n1513), .C(n1512), .Y(
        regs_rf_data_out[0]) );
  NAND3_X1A_A9TH U2061 ( .A(n1524), .B(n1523), .C(n1522), .Y(
        regs_rf_data_out[2]) );
  NOR2_X1M_A9TH U2062 ( .A(n2421), .B(n2372), .Y(regs_lsr0) );
  NAND2B_X1M_A9TH U2065 ( .AN(n2096), .B(n2092), .Y(n1421) );
  NAND3_X1A_A9TH U2068 ( .A(n2533), .B(n2529), .C(n2528), .Y(n1174) );
  NOR2_X1M_A9TH U2075 ( .A(regs_rf_pop), .B(n1856), .Y(n1458) );
  NOR2_X1M_A9TH U2079 ( .A(n2596), .B(n1729), .Y(regs_N125) );
  NOR2_X1M_A9TH U2127 ( .A(n2598), .B(n2607), .Y(regs_N117) );
  NOR3_X1M_A9TH U2147 ( .A(wb_interface_wbstate[1]), .B(
        wb_interface_wbstate[0]), .C(n2617), .Y(n1480) );
  INV_X1B_A9TH U2276 ( .A(n2625), .Y(regs_dl[9]) );
  INV_X1B_A9TH U2282 ( .A(n2626), .Y(regs_receiver_rf_push_q) );
endmodule

