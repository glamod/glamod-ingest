\connect cdmlite
CREATE OR REPLACE FUNCTION lite.observation_insert_trigger()
    RETURNS TRIGGER AS $$
    BEGIN
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1761-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1762-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1761_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1761_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1761_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1762-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1763-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1762_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1762_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1762_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1763-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1764-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1763_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1763_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1763_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1764-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1765-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1764_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1764_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1764_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1765-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1766-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1765_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1765_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1765_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1766-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1767-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1766_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1766_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1766_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1767-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1768-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1767_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1767_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1767_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1768-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1769-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1768_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1768_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1768_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1769-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1770-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1769_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1769_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1769_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1770-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1771-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1770_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1770_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1770_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1771-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1772-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1771_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1771_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1771_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1772-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1773-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1772_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1772_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1772_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1773-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1774-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1773_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1773_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1773_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1774-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1775-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1774_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1774_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1774_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1775-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1776-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1775_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1775_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1775_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1776-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1777-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1776_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1776_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1776_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1777-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1778-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1777_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1777_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1777_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1778-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1779-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1778_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1778_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1778_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1779-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1780-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1779_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1779_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1779_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1780-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1781-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1780_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1780_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1780_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1781-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1782-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1781_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1781_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1781_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1782-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1783-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1782_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1782_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1782_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1783-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1784-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1783_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1783_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1783_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1784-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1785-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1784_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1784_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1784_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1785-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1786-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1785_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1785_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1785_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1786-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1787-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1786_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1786_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1786_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1787-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1788-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1787_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1787_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1787_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1788-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1789-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1788_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1788_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1788_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1789-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1790-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1789_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1789_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1789_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1790-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1791-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1790_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1790_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1790_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1791-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1792-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1791_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1791_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1791_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1792-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1793-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1792_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1792_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1792_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1793-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1794-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1793_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1793_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1793_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1794-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1795-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1794_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1794_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1794_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1795-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1796-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1795_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1795_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1795_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1796-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1797-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1796_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1796_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1796_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1797-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1798-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1797_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1797_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1797_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1798-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1799-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1798_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1798_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1798_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1799-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1800-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1799_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1799_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1799_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1800-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1801-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1800_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1800_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1800_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1801-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1802-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1801_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1801_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1801_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1802-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1803-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1802_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1802_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1802_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1803-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1804-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1803_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1803_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1803_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1804-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1805-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1804_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1804_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1804_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1805-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1806-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1805_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1805_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1805_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1806-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1807-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1806_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1806_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1806_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1807-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1808-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1807_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1807_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1807_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1808-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1809-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1808_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1808_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1808_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1809-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1810-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1809_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1809_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1809_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1810-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1811-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1810_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1810_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1810_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1811-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1812-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1811_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1811_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1811_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1812-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1813-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1812_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1812_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1812_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1813-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1814-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1813_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1813_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1813_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1814-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1815-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1814_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1814_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1814_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1815-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1816-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1815_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1815_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1815_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1816-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1817-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1816_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1816_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1816_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1817-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1818-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1817_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1817_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1817_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1818-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1819-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1818_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1818_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1818_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1819-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1820-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1819_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1819_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1819_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1820-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1821-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1820_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1820_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1820_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1821-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1822-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1821_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1821_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1821_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1822-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1823-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1822_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1822_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1822_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1823-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1824-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1823_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1823_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1823_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1824-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1825-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1824_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1824_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1824_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1825-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1826-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1825_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1825_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1825_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1826-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1827-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1826_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1826_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1826_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1827-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1828-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1827_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1827_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1827_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1828-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1829-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1828_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1828_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1828_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1829-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1830-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1829_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1829_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1829_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1830-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1831-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1830_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1830_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1830_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1831-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1832-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1831_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1831_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1831_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1832-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1833-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1832_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1832_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1832_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1833-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1834-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1833_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1833_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1833_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1834-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1835-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1834_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1834_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1834_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1835-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1836-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1835_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1835_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1835_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1836-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1837-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1836_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1836_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1836_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1837-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1838-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1837_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1837_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1837_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1838-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1839-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1838_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1838_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1838_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1839-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1840-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1839_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1839_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1839_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1840-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1841-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1840_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1840_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1840_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1841-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1842-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1841_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1841_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1841_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1842-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1843-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1842_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1842_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1842_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1843-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1844-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1843_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1843_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1843_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1844-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1845-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1844_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1844_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1844_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1845-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1846-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1845_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1845_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1845_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1846-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1847-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1846_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1846_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1846_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1847-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1848-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1847_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1847_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1847_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1848-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1849-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1848_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1848_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1848_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1849-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1850-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1849_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1849_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1849_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1850-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1851-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1850_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1850_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1850_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1851-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1852-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1851_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1851_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1851_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1852-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1853-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1852_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1852_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1852_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1853-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1854-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1853_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1853_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1853_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1854-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1855-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1854_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1854_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1854_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1855-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1856-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1855_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1855_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1855_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1856-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1857-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1856_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1856_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1856_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1857-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1858-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1857_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1857_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1857_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1858-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1859-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1858_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1858_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1858_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1859-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1860-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1859_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1859_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1859_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1860-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1861-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1860_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1860_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1860_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1861-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1862-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1861_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1861_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1861_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1862-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1863-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1862_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1862_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1862_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1863-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1864-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1863_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1863_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1863_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1864-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1865-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1864_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1864_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1864_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1865-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1866-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1865_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1865_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1865_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1866-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1867-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1866_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1866_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1866_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1867-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1868-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1867_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1867_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1867_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1868-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1869-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1868_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1868_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1868_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1869-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1870-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1869_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1869_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1869_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1870-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1871-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1870_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1870_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1870_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1871-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1872-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1871_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1871_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1871_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1872-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1873-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1872_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1872_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1872_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1873-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1874-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1873_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1873_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1873_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1874-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1875-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1874_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1874_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1874_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1875-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1876-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1875_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1875_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1875_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1876-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1877-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1876_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1876_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1876_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1877-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1878-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1877_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1877_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1877_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1878-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1879-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1878_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1878_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1878_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1879-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1880-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1879_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1879_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1879_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1880-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1881-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1880_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1880_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1880_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1881-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1882-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1881_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1881_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1881_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1882-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1883-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1882_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1882_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1882_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1883-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1884-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1883_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1883_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1883_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1884-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1885-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1884_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1884_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1884_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1885-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1886-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1885_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1885_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1885_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1886-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1887-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1886_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1886_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1886_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1887-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1888-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1887_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1887_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1887_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1888-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1889-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1888_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1888_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1888_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1889-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1890-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1889_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1889_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1889_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1890-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1891-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1890_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1890_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1890_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1891-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1892-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1891_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1891_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1891_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1892-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1893-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1892_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1892_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1892_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1893-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1894-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1893_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1893_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1893_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1894-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1895-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1894_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1894_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1894_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1895-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1896-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1895_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1895_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1895_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1896-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1897-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1896_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1896_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1896_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1897-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1898-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1897_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1897_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1897_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1898-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1899-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1898_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1898_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1898_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1899-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1900-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1899_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1899_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1899_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1900-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1901-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1900_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1900_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1900_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1901-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1902-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1901_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1901_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1901_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1902-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1903-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1902_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1902_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1902_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1903-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1904-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1903_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1903_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1903_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1904-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1905-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1904_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1904_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1904_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1905-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1906-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1905_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1905_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1905_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1906-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1907-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1906_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1906_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1906_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1907-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1908-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1907_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1907_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1907_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1908-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1909-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1908_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1908_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1908_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1909-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1910-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1909_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1909_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1909_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1910-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1911-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1910_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1910_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1910_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1911-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1912-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1911_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1911_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1911_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1912-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1913-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1912_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1912_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1912_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1913-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1914-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1913_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1913_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1913_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1914-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1915-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1914_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1914_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1914_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1915-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1916-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1915_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1915_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1915_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1916-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1917-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1916_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1916_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1916_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1917-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1918-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1917_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1917_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1917_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1918-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1919-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1918_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1918_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1918_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1919-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1920-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1919_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1919_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1919_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1920-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1921-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1920_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1920_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1920_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1921-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1922-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1921_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1921_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1921_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1922-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1923-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1922_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1922_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1922_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1923-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1924-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1923_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1923_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1923_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1924-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1925-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1924_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1924_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1924_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1925-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1926-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1925_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1925_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1925_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1926-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1927-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1926_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1926_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1926_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1927-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1928-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1927_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1927_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1927_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1928-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1929-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1928_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1928_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1928_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1929-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1930-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1929_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1929_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1929_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1930-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1931-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1930_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1930_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1930_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1931-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1932-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1931_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1931_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1931_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1932-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1933-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1932_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1932_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1932_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1933-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1934-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1933_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1933_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1933_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1934-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1935-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1934_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1934_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1934_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1935-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1936-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1935_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1935_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1935_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1936-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1937-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1936_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1936_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1936_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1937-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1938-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1937_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1937_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1937_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1938-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1939-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1938_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1938_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1938_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1939-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1940-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1939_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1939_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1939_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1940-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1941-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1940_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1940_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1940_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1941-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1942-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1941_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1941_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1941_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1942-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1943-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1942_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1942_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1942_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1943-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1944-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1943_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1943_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1943_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1944-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1945-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1944_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1944_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1944_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1945-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1946-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1945_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1945_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1945_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1946-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1947-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1946_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1946_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1946_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1946_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1947-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1948-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1947_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1947_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1947_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1947_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1948-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1949-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1948_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1948_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1948_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1948_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1949-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1950-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1949_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1949_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1949_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1949_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1950-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1951-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1950_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1950_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1950_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1950_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1951-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1952-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1951_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1951_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1951_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1951_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1952-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1953-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1952_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1952_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1952_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1952_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1953-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1954-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1953_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1953_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1953_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1953_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1954-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1955-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1954_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1954_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1954_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1954_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1955-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1956-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1955_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1955_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1955_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1955_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1956-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1957-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1956_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1956_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1956_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1956_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1957-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1958-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1957_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1957_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1957_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1957_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1958-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1959-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1958_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1958_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1958_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1958_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1959-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1960-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1959_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1959_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1959_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1959_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1960-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1961-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1960_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1960_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1960_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1960_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1961-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1962-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1961_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1961_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1961_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1961_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1962-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1963-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1962_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1962_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1962_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1962_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1963-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1964-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1963_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1963_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1963_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1963_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1964-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1965-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1964_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1964_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1964_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1964_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1965-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1966-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1965_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1965_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1965_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1965_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1966-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1967-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1966_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1966_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1966_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1966_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1967-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1968-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1967_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1967_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1967_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1967_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1968-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1969-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1968_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1968_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1968_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1968_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1969-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1970-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1969_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1969_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1969_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1969_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1970-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1971-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1970_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1970_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1970_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1970_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1971-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1972-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1971_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1971_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1971_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1971_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1972-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1973-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1972_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1972_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1972_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1972_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1973-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1974-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1973_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1973_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1973_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1973_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1974-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1975-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1974_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1974_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1974_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1974_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1975-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1976-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1975_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1975_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1975_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1975_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1976-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1977-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1976_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1976_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1976_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1976_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1977-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1978-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1977_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1977_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1977_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1977_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1978-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1979-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1978_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1978_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1978_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1978_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1979-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1980-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1979_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1979_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1979_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1979_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1980-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1981-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1980_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1980_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1980_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1980_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1981-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1982-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1981_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1981_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1981_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1981_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1982-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1983-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1982_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1982_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1982_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1982_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1983-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1984-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1983_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1983_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1983_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1983_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1984-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1985-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1984_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1984_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1984_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1984_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1985-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1986-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1985_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1985_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1985_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1985_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1986-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1987-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1986_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1986_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1986_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1986_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1987-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1988-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1987_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1987_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1987_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1987_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1988-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1989-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1988_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1988_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1988_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1988_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1989-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1990-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1989_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1989_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1989_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1989_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1990-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1991-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1990_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1990_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1990_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1990_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1991-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1992-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1991_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1991_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1991_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1991_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1992-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1993-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1992_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1992_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1992_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1992_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1993-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1994-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1993_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1993_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1993_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1993_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1994-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1995-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1994_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1994_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1994_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1994_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1995-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1996-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1995_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1995_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1995_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1995_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1996-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1997-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1996_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1996_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1996_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1996_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1997-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1998-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1997_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1997_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1997_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1997_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1998-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '1999-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1998_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1998_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1998_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1998_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '1999-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2000-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1999_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_1999_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_1999_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_1999_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2000-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2001-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2000_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2000_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2000_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2000_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2001-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2002-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2001_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2001_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2001_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2001_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2002-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2003-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2002_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2002_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2002_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2002_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2003-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2004-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2003_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2003_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2003_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2003_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2004-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2005-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2004_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2004_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2004_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2004_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2005-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2006-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2005_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2005_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2005_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2005_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2006-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2007-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2006_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2006_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2006_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2006_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2007-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2008-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2007_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2007_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2007_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2007_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2008-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2009-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2008_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2008_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2008_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2008_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2009-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2010-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2009_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2009_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2009_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2009_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2010-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2011-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2010_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2010_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2010_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2010_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2011-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2012-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2011_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2011_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2011_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2011_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2012-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2013-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2012_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2012_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2012_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2012_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2013-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2014-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2013_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2013_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2013_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2013_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2014-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2015-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2014_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2014_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2014_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2014_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2015-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2016-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2015_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2015_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2015_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2015_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2016-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2017-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2016_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2016_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2016_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2016_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2017-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2018-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2017_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2017_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2017_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2017_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '2018-01-01 00:00:0.0+0' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '2019-01-01 00:00:0.0+0' THEN
            IF NEW.station_type = 1 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2018_land_0 VALUES(NEW.*);
                ELSIF NEW.report_type = 2 THEN
                    INSERT INTO lite.observations_2018_land_2 VALUES(NEW.*);
                ELSIF NEW.report_type = 3 THEN
                    INSERT INTO lite.observations_2018_land_3 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSIF NEW.station_type = 2 THEN
                IF NEW.report_type = 0 THEN
                    INSERT INTO lite.observations_2018_marine_0 VALUES(NEW.*);
                ELSE
                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';
                END IF;
            ELSE
                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';
            END IF;
        END IF;
      RETURN NULL;
    END
$$
LANGUAGE plpgsql;
