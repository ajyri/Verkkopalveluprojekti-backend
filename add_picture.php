<?php
require_once './inc/functions.php';
require_once './inc/headers.php';


if (isset($_FILES['file'])) {
    if ($_FILES['file']['error'] === UPLOAD_ERR_OK) {
        $filename = $_FILES['file']['name'];
        $type = $_FILES['file']['type'];
        if ($type === 'image/jpeg' || $type === 'image/png') {
            $path = 'img/' . basename($filename);
            if (move_uploaded_file($_FILES['file']['tmp_name'],$path)) {
                $data = array('filename' => $filename,'type' => $type);
                echo json_encode($data);
            } else {
                returnImageError('Error saving image to img');
            } 
        } else {
            returnImageError('Wrong file type!');
        }
    } else {
        returnImageError('Error uploading image!');
    }

} else {
    returnImageError('Image was not uploaded');
}