import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
    container: {
      flex: 1,
      flexDirection: 'column',
      backgroundColor: '#1F1D45',
      alignItems: 'center',
      justifyContent: 'center',
      color: '#fff'
    },
    logoWraper:{
      alignItems: 'center',
      justifyContent: 'center',
      marginTop: 80,
      flex: 1
    },
    logo:{
      height: 124.4,
      width: 320.4,
      
    },
    inputWraper: {
      marginTop: 40,
      flex: 2,
      width: '60%',
    },
    input:{
      color: '#1F1D45',
      backgroundColor: '#c6c6c6',
      borderBottomColor: '#000000',
      borderBottomWidth: 1,
      borderRadius: 6,
      marginBottom: 15,
      height: 42,
      textAlign: 'center'
    },
    embaixo:{
      flex: 3,
      backgroundColor: "green"
      
    }
  });

export default styles;