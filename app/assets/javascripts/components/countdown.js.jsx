var Countdown = React.createClass({
  getInitialState: function() {
    start = new Date(this.props.startTime).getTime();
    current = new Date(this.props.currentTime).getTime();
    time = this.setTime(start, current);
    return {
      currentTime: current,
      start: start,
      daysLeft: time[0],
      hoursLeft: time[1],
      minutesLeft: time[2],
      secondsLeft: time[3],
    };
  },
  setTime: function(start, currTime) {
    time = start - currTime;
    days = Math.floor(time/(86400000));
    time -= days*86400000;
    hours = Math.floor(time/(3600000));
    time -= hours*3600000;
    minutes = Math.floor(time/(60000));
    time -= minutes*60000;
    seconds = Math.floor(time/(1000));
    return [days, hours, minutes, seconds];
  },
  tick: function() {
    this.setState({currentTime: this.state.currentTime + 1000})
    count = this.setTime(this.state.start, this.state.currentTime);
    this.setState({daysLeft: count[0]});
    this.setState({hoursLeft: count[1]});
    this.setState({minutesLeft: count[2]});
    this.setState({secondsLeft: count[3]});
  },
  componentDidMount: function() {
    this.interval = setInterval(this.tick, 1000);
  },
  componentWillUnmount: function() {
    clearInterval(this.interval);
  },
  format: function(number) {
    if(number < 10 && number >= 0) {
      return ("0"+number.toString());
    }
    return (number);
  },
  render: function() {
    stt = this.state;
    days = this.format(stt.daysLeft);
    if(this.state.currentTime > this.state.start){
      out = 'Its showtime!';
    } else {
      out = this.format(stt.daysLeft) + ":" + this.format(stt.hoursLeft) + ":" +
      this.format(stt.minutesLeft) + ":" + this.format(stt.secondsLeft);
    }
    return (
      <div>
        <h1 className="countdown">{out}</h1>
      </div>
    );
  }
});
