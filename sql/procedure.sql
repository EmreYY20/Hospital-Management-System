-- Create stored procedure
CREATE OR REPLACE FUNCTION check_room_capacity() 
RETURNS TRIGGER AS $$
BEGIN
  -- If the number of patients in the room is greater than or equal to the room's capacity
  IF (SELECT COUNT(*) FROM patient WHERE assigned_room = NEW.assigned_room) >= 
     (SELECT capacity FROM room WHERE room_number = NEW.assigned_room) THEN
    -- Update the 'free_of_it' field in the 'room' table
    UPDATE room SET free_of_it = capacity - 
      (SELECT COUNT(*) FROM patient WHERE assigned_room = NEW.assigned_room)
      WHERE room_number = NEW.assigned_room;
  ELSE
    -- Update the 'free_of_it' field in the 'room' table
    UPDATE room SET free_of_it = capacity - 
      (SELECT COUNT(*) FROM patient WHERE assigned_room = NEW.assigned_room)
      WHERE room_number = NEW.assigned_room;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger
CREATE TRIGGER room_capacity_trigger
AFTER INSERT OR UPDATE OF assigned_room ON patient
FOR EACH ROW EXECUTE PROCEDURE check_room_capacity();
