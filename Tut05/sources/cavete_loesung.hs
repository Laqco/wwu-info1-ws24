--------------------------------------neu--------------------------------------
-- b)

-- Rabatt im Einkauf, wenn "viele" Gerichte gekauft werden.
discount :: Double
discount = 0.05

-- Schwellwert, ab dem ein Rabatt fuer "viele" Gerichte gewaehrt wird.
discount_threshold :: Int
discount_threshold = 150

-- Anzahl Portionen, die maximal verkauft werden koennen.
max_portions :: Int
max_portions = 300

--------------------------------------unveraendert--------------------------------------

-- Preis pro Portion
price_per_portion :: Double
price_per_portion = 2.0

-- Basiskosten fuer Koch/Miete/...
base_costs :: Double
base_costs = 200.0

-- Aktueller Preis fuer das Gericht
base_price :: Double
base_price = 9.90

-- Anzahl Portionen, die bei einem Preis von "base_price" verkauft werden
base_portions :: Int
base_portions = 100

--------------------------------------veraendert--------------------------------------
-- a) c)

-- Anzahl der Portionen, die pro Euro Preisanstieg weniger verkauft werden
demand_decrease :: Double -> Int
demand_decrease delta = round (delta^3 + 9*delta)

--------------------------------------neu--------------------------------------
-- c)

-- Beschränkt die Anzahl der Portionen
capped_portions :: Int -> Int
capped_portions portions
    | portions < 0            = 0
    | portions > max_portions = max_portions
    | otherwise               = portions

--------------------------------------veraendert--------------------------------------
-- c)

-- Die Funktion "portions" berechnet die Anzahl der Portionen,
-- welche zu einem Preis von "price" verkauft werden.
portions :: Double -> Int
portions price = capped_portions (base_portions - demand_decrease (price - base_price))

--------------------------------------neu--------------------------------------
-- c)

-- Berechnet den Preis pro Portion unter Beruecksichtigung eines moeglichen Rabatts bei "vielen" Gerichten
portion_price :: Int -> Double
portion_price meals =
    if meals >= discount_threshold
    then price_per_portion * (1 - discount)
    else price_per_portion

--------------------------------------veraendert--------------------------------------
-- c)

-- Die Funktion "costs" berechnet die Ausgaben, welche durch
-- den Verkauf der Nudeln zu einem Preis "price" entstehen. 
costs :: Double -> Double
costs price = base_costs + fromIntegral (portions price) * portion_price (portions price)

--------------------------------------unveraendert--------------------------------------

-- Die Funktion "revenue" berechnet die Einnahmen, welche durch
-- den Verkauf der Nudeln zu einem Preis "price" erzielt werden. 
revenue :: Double -> Double
revenue price = price * fromIntegral (portions price)

-- Die Funktion "profit" berechnet den Gewinn, welcher durch den Verkauf 
-- des Gerichts "Nudeln 1" auf Basis des Preises "price" erzielt wird.
profit :: Double -> Double
profit price = (revenue price) - (costs price)
