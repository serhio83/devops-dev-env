--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.9
-- Dumped by pg_dump version 9.5.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: access; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE access (
    id bigint NOT NULL,
    user_id bigint,
    repo_id bigint,
    mode integer
);


ALTER TABLE access OWNER TO gogs;

--
-- Name: access_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE access_id_seq OWNER TO gogs;

--
-- Name: access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE access_id_seq OWNED BY access.id;


--
-- Name: access_token; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE access_token (
    id bigint NOT NULL,
    uid bigint,
    name character varying(255),
    sha1 character varying(40),
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE access_token OWNER TO gogs;

--
-- Name: access_token_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE access_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE access_token_id_seq OWNER TO gogs;

--
-- Name: access_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE access_token_id_seq OWNED BY access_token.id;


--
-- Name: action; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE action (
    id bigint NOT NULL,
    user_id bigint,
    op_type integer,
    act_user_id bigint,
    act_user_name character varying(255),
    repo_id bigint,
    repo_user_name character varying(255),
    repo_name character varying(255),
    ref_name character varying(255),
    is_private boolean DEFAULT false NOT NULL,
    content text,
    created_unix bigint
);


ALTER TABLE action OWNER TO gogs;

--
-- Name: action_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE action_id_seq OWNER TO gogs;

--
-- Name: action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE action_id_seq OWNED BY action.id;


--
-- Name: attachment; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE attachment (
    id bigint NOT NULL,
    uuid uuid,
    issue_id bigint,
    comment_id bigint,
    release_id bigint,
    name character varying(255),
    created_unix bigint
);


ALTER TABLE attachment OWNER TO gogs;

--
-- Name: attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attachment_id_seq OWNER TO gogs;

--
-- Name: attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE attachment_id_seq OWNED BY attachment.id;


--
-- Name: collaboration; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE collaboration (
    id bigint NOT NULL,
    repo_id bigint NOT NULL,
    user_id bigint NOT NULL,
    mode integer DEFAULT 2 NOT NULL
);


ALTER TABLE collaboration OWNER TO gogs;

--
-- Name: collaboration_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE collaboration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE collaboration_id_seq OWNER TO gogs;

--
-- Name: collaboration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE collaboration_id_seq OWNED BY collaboration.id;


--
-- Name: comment; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE comment (
    id bigint NOT NULL,
    type integer,
    poster_id bigint,
    issue_id bigint,
    commit_id bigint,
    line bigint,
    content text,
    created_unix bigint,
    updated_unix bigint,
    commit_sha character varying(40)
);


ALTER TABLE comment OWNER TO gogs;

--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comment_id_seq OWNER TO gogs;

--
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE comment_id_seq OWNED BY comment.id;


--
-- Name: deploy_key; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE deploy_key (
    id bigint NOT NULL,
    key_id bigint,
    repo_id bigint,
    name character varying(255),
    fingerprint character varying(255),
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE deploy_key OWNER TO gogs;

--
-- Name: deploy_key_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE deploy_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE deploy_key_id_seq OWNER TO gogs;

--
-- Name: deploy_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE deploy_key_id_seq OWNED BY deploy_key.id;


--
-- Name: email_address; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE email_address (
    id bigint NOT NULL,
    uid bigint NOT NULL,
    email character varying(255) NOT NULL,
    is_activated boolean
);


ALTER TABLE email_address OWNER TO gogs;

--
-- Name: email_address_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE email_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE email_address_id_seq OWNER TO gogs;

--
-- Name: email_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE email_address_id_seq OWNED BY email_address.id;


--
-- Name: follow; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE follow (
    id bigint NOT NULL,
    user_id bigint,
    follow_id bigint
);


ALTER TABLE follow OWNER TO gogs;

--
-- Name: follow_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE follow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE follow_id_seq OWNER TO gogs;

--
-- Name: follow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE follow_id_seq OWNED BY follow.id;


--
-- Name: hook_task; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE hook_task (
    id bigint NOT NULL,
    repo_id bigint,
    hook_id bigint,
    uuid character varying(255),
    type integer,
    url text,
    signature text,
    payload_content text,
    content_type integer,
    event_type character varying(255),
    is_ssl boolean,
    is_delivered boolean,
    delivered bigint,
    is_succeed boolean,
    request_content text,
    response_content text
);


ALTER TABLE hook_task OWNER TO gogs;

--
-- Name: hook_task_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE hook_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hook_task_id_seq OWNER TO gogs;

--
-- Name: hook_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE hook_task_id_seq OWNED BY hook_task.id;


--
-- Name: issue; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE issue (
    id bigint NOT NULL,
    repo_id bigint,
    index bigint,
    poster_id bigint,
    name character varying(255),
    content text,
    milestone_id bigint,
    priority integer,
    assignee_id bigint,
    is_closed boolean,
    is_pull boolean,
    num_comments integer,
    deadline_unix bigint,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE issue OWNER TO gogs;

--
-- Name: issue_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE issue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issue_id_seq OWNER TO gogs;

--
-- Name: issue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE issue_id_seq OWNED BY issue.id;


--
-- Name: issue_label; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE issue_label (
    id bigint NOT NULL,
    issue_id bigint,
    label_id bigint
);


ALTER TABLE issue_label OWNER TO gogs;

--
-- Name: issue_label_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE issue_label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issue_label_id_seq OWNER TO gogs;

--
-- Name: issue_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE issue_label_id_seq OWNED BY issue_label.id;


--
-- Name: issue_user; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE issue_user (
    id bigint NOT NULL,
    uid bigint,
    issue_id bigint,
    repo_id bigint,
    milestone_id bigint,
    is_read boolean,
    is_assigned boolean,
    is_mentioned boolean,
    is_poster boolean,
    is_closed boolean
);


ALTER TABLE issue_user OWNER TO gogs;

--
-- Name: issue_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE issue_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issue_user_id_seq OWNER TO gogs;

--
-- Name: issue_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE issue_user_id_seq OWNED BY issue_user.id;


--
-- Name: label; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE label (
    id bigint NOT NULL,
    repo_id bigint,
    name character varying(255),
    color character varying(7),
    num_issues integer,
    num_closed_issues integer
);


ALTER TABLE label OWNER TO gogs;

--
-- Name: label_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE label_id_seq OWNER TO gogs;

--
-- Name: label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE label_id_seq OWNED BY label.id;


--
-- Name: login_source; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE login_source (
    id bigint NOT NULL,
    type integer,
    name character varying(255),
    is_actived boolean DEFAULT false NOT NULL,
    cfg text,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE login_source OWNER TO gogs;

--
-- Name: login_source_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE login_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE login_source_id_seq OWNER TO gogs;

--
-- Name: login_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE login_source_id_seq OWNED BY login_source.id;


--
-- Name: milestone; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE milestone (
    id bigint NOT NULL,
    repo_id bigint,
    name character varying(255),
    content text,
    is_closed boolean,
    num_issues integer,
    num_closed_issues integer,
    completeness integer,
    deadline_unix bigint,
    closed_date_unix bigint
);


ALTER TABLE milestone OWNER TO gogs;

--
-- Name: milestone_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE milestone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE milestone_id_seq OWNER TO gogs;

--
-- Name: milestone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE milestone_id_seq OWNED BY milestone.id;


--
-- Name: mirror; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE mirror (
    id bigint NOT NULL,
    repo_id bigint,
    "interval" integer,
    enable_prune boolean DEFAULT true NOT NULL,
    updated_unix bigint,
    next_update_unix bigint
);


ALTER TABLE mirror OWNER TO gogs;

--
-- Name: mirror_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE mirror_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mirror_id_seq OWNER TO gogs;

--
-- Name: mirror_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE mirror_id_seq OWNED BY mirror.id;


--
-- Name: notice; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE notice (
    id bigint NOT NULL,
    type integer,
    description text,
    created_unix bigint
);


ALTER TABLE notice OWNER TO gogs;

--
-- Name: notice_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE notice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notice_id_seq OWNER TO gogs;

--
-- Name: notice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE notice_id_seq OWNED BY notice.id;


--
-- Name: org_user; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE org_user (
    id bigint NOT NULL,
    uid bigint,
    org_id bigint,
    is_public boolean,
    is_owner boolean,
    num_teams integer
);


ALTER TABLE org_user OWNER TO gogs;

--
-- Name: org_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE org_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE org_user_id_seq OWNER TO gogs;

--
-- Name: org_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE org_user_id_seq OWNED BY org_user.id;


--
-- Name: protect_branch; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE protect_branch (
    id bigint NOT NULL,
    repo_id bigint,
    name character varying(255),
    protected boolean,
    require_pull_request boolean,
    enable_whitelist boolean,
    whitelist_user_i_ds text,
    whitelist_team_i_ds text
);


ALTER TABLE protect_branch OWNER TO gogs;

--
-- Name: protect_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE protect_branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE protect_branch_id_seq OWNER TO gogs;

--
-- Name: protect_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE protect_branch_id_seq OWNED BY protect_branch.id;


--
-- Name: protect_branch_whitelist; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE protect_branch_whitelist (
    id bigint NOT NULL,
    protect_branch_id bigint,
    repo_id bigint,
    name character varying(255),
    user_id bigint
);


ALTER TABLE protect_branch_whitelist OWNER TO gogs;

--
-- Name: protect_branch_whitelist_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE protect_branch_whitelist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE protect_branch_whitelist_id_seq OWNER TO gogs;

--
-- Name: protect_branch_whitelist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE protect_branch_whitelist_id_seq OWNED BY protect_branch_whitelist.id;


--
-- Name: public_key; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE public_key (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    fingerprint character varying(255) NOT NULL,
    content text NOT NULL,
    mode integer DEFAULT 2 NOT NULL,
    type integer DEFAULT 1 NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public_key OWNER TO gogs;

--
-- Name: public_key_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE public_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public_key_id_seq OWNER TO gogs;

--
-- Name: public_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE public_key_id_seq OWNED BY public_key.id;


--
-- Name: pull_request; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE pull_request (
    id bigint NOT NULL,
    type integer,
    status integer,
    issue_id bigint,
    index bigint,
    head_repo_id bigint,
    base_repo_id bigint,
    head_user_name character varying(255),
    head_branch character varying(255),
    base_branch character varying(255),
    merge_base character varying(40),
    has_merged boolean,
    merged_commit_id character varying(40),
    merger_id bigint,
    merged_unix bigint
);


ALTER TABLE pull_request OWNER TO gogs;

--
-- Name: pull_request_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE pull_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pull_request_id_seq OWNER TO gogs;

--
-- Name: pull_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE pull_request_id_seq OWNED BY pull_request.id;


--
-- Name: release; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE release (
    id bigint NOT NULL,
    repo_id bigint,
    publisher_id bigint,
    tag_name character varying(255),
    lower_tag_name character varying(255),
    target character varying(255),
    title character varying(255),
    sha1 character varying(40),
    num_commits bigint,
    note text,
    is_draft boolean DEFAULT false NOT NULL,
    is_prerelease boolean,
    created_unix bigint
);


ALTER TABLE release OWNER TO gogs;

--
-- Name: release_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE release_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE release_id_seq OWNER TO gogs;

--
-- Name: release_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE release_id_seq OWNED BY release.id;


--
-- Name: repository; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE repository (
    id bigint NOT NULL,
    owner_id bigint,
    lower_name character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    website character varying(255),
    default_branch character varying(255),
    size bigint DEFAULT 0 NOT NULL,
    num_watches integer,
    num_stars integer,
    num_forks integer,
    num_issues integer,
    num_closed_issues integer,
    num_pulls integer,
    num_closed_pulls integer,
    num_milestones integer DEFAULT 0 NOT NULL,
    num_closed_milestones integer DEFAULT 0 NOT NULL,
    is_private boolean,
    is_bare boolean,
    is_mirror boolean,
    enable_wiki boolean DEFAULT true NOT NULL,
    allow_public_wiki boolean,
    enable_external_wiki boolean,
    external_wiki_url character varying(255),
    enable_issues boolean DEFAULT true NOT NULL,
    allow_public_issues boolean,
    enable_external_tracker boolean,
    external_tracker_url character varying(255),
    external_tracker_format character varying(255),
    external_tracker_style character varying(255),
    enable_pulls boolean DEFAULT true NOT NULL,
    is_fork boolean DEFAULT false NOT NULL,
    fork_id bigint,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE repository OWNER TO gogs;

--
-- Name: repository_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE repository_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE repository_id_seq OWNER TO gogs;

--
-- Name: repository_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE repository_id_seq OWNED BY repository.id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE star (
    id bigint NOT NULL,
    uid bigint,
    repo_id bigint
);


ALTER TABLE star OWNER TO gogs;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE star_id_seq OWNER TO gogs;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE star_id_seq OWNED BY star.id;


--
-- Name: team; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE team (
    id bigint NOT NULL,
    org_id bigint,
    lower_name character varying(255),
    name character varying(255),
    description character varying(255),
    authorize integer,
    num_repos integer,
    num_members integer
);


ALTER TABLE team OWNER TO gogs;

--
-- Name: team_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE team_id_seq OWNER TO gogs;

--
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE team_id_seq OWNED BY team.id;


--
-- Name: team_repo; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE team_repo (
    id bigint NOT NULL,
    org_id bigint,
    team_id bigint,
    repo_id bigint
);


ALTER TABLE team_repo OWNER TO gogs;

--
-- Name: team_repo_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE team_repo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE team_repo_id_seq OWNER TO gogs;

--
-- Name: team_repo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE team_repo_id_seq OWNED BY team_repo.id;


--
-- Name: team_user; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE team_user (
    id bigint NOT NULL,
    org_id bigint,
    team_id bigint,
    uid bigint
);


ALTER TABLE team_user OWNER TO gogs;

--
-- Name: team_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE team_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE team_user_id_seq OWNER TO gogs;

--
-- Name: team_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE team_user_id_seq OWNED BY team_user.id;


--
-- Name: two_factor; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE two_factor (
    id bigint NOT NULL,
    user_id bigint,
    secret character varying(255),
    created_unix bigint
);


ALTER TABLE two_factor OWNER TO gogs;

--
-- Name: two_factor_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE two_factor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE two_factor_id_seq OWNER TO gogs;

--
-- Name: two_factor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE two_factor_id_seq OWNED BY two_factor.id;


--
-- Name: two_factor_recovery_code; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE two_factor_recovery_code (
    id bigint NOT NULL,
    user_id bigint,
    code character varying(11),
    is_used boolean
);


ALTER TABLE two_factor_recovery_code OWNER TO gogs;

--
-- Name: two_factor_recovery_code_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE two_factor_recovery_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE two_factor_recovery_code_id_seq OWNER TO gogs;

--
-- Name: two_factor_recovery_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE two_factor_recovery_code_id_seq OWNED BY two_factor_recovery_code.id;


--
-- Name: upload; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE upload (
    id bigint NOT NULL,
    uuid uuid,
    name character varying(255)
);


ALTER TABLE upload OWNER TO gogs;

--
-- Name: upload_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE upload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE upload_id_seq OWNER TO gogs;

--
-- Name: upload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE upload_id_seq OWNED BY upload.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE "user" (
    id bigint NOT NULL,
    lower_name character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    full_name character varying(255),
    email character varying(255) NOT NULL,
    passwd character varying(255) NOT NULL,
    login_type integer,
    login_source bigint DEFAULT 0 NOT NULL,
    login_name character varying(255),
    type integer,
    location character varying(255),
    website character varying(255),
    rands character varying(10),
    salt character varying(10),
    created_unix bigint,
    updated_unix bigint,
    last_repo_visibility boolean,
    max_repo_creation integer DEFAULT '-1'::integer NOT NULL,
    is_active boolean,
    is_admin boolean,
    allow_git_hook boolean,
    allow_import_local boolean,
    prohibit_login boolean,
    avatar character varying(2048) NOT NULL,
    avatar_email character varying(255) NOT NULL,
    use_custom_avatar boolean,
    num_followers integer,
    num_following integer DEFAULT 0 NOT NULL,
    num_stars integer,
    num_repos integer,
    description character varying(255),
    num_teams integer,
    num_members integer
);


ALTER TABLE "user" OWNER TO gogs;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO gogs;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- Name: version; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE version (
    id bigint NOT NULL,
    version bigint
);


ALTER TABLE version OWNER TO gogs;

--
-- Name: version_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE version_id_seq OWNER TO gogs;

--
-- Name: version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE version_id_seq OWNED BY version.id;


--
-- Name: watch; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE watch (
    id bigint NOT NULL,
    user_id bigint,
    repo_id bigint
);


ALTER TABLE watch OWNER TO gogs;

--
-- Name: watch_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE watch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE watch_id_seq OWNER TO gogs;

--
-- Name: watch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE watch_id_seq OWNED BY watch.id;


--
-- Name: webhook; Type: TABLE; Schema: public; Owner: gogs
--

CREATE TABLE webhook (
    id bigint NOT NULL,
    repo_id bigint,
    org_id bigint,
    url text,
    content_type integer,
    secret text,
    events text,
    is_ssl boolean,
    is_active boolean,
    hook_task_type integer,
    meta text,
    last_status integer,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE webhook OWNER TO gogs;

--
-- Name: webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: gogs
--

CREATE SEQUENCE webhook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webhook_id_seq OWNER TO gogs;

--
-- Name: webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gogs
--

ALTER SEQUENCE webhook_id_seq OWNED BY webhook.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY access ALTER COLUMN id SET DEFAULT nextval('access_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY access_token ALTER COLUMN id SET DEFAULT nextval('access_token_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY action ALTER COLUMN id SET DEFAULT nextval('action_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY attachment ALTER COLUMN id SET DEFAULT nextval('attachment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY collaboration ALTER COLUMN id SET DEFAULT nextval('collaboration_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY deploy_key ALTER COLUMN id SET DEFAULT nextval('deploy_key_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY email_address ALTER COLUMN id SET DEFAULT nextval('email_address_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY follow ALTER COLUMN id SET DEFAULT nextval('follow_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY hook_task ALTER COLUMN id SET DEFAULT nextval('hook_task_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY issue ALTER COLUMN id SET DEFAULT nextval('issue_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY issue_label ALTER COLUMN id SET DEFAULT nextval('issue_label_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY issue_user ALTER COLUMN id SET DEFAULT nextval('issue_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY label ALTER COLUMN id SET DEFAULT nextval('label_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY login_source ALTER COLUMN id SET DEFAULT nextval('login_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY milestone ALTER COLUMN id SET DEFAULT nextval('milestone_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY mirror ALTER COLUMN id SET DEFAULT nextval('mirror_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY notice ALTER COLUMN id SET DEFAULT nextval('notice_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY org_user ALTER COLUMN id SET DEFAULT nextval('org_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY protect_branch ALTER COLUMN id SET DEFAULT nextval('protect_branch_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY protect_branch_whitelist ALTER COLUMN id SET DEFAULT nextval('protect_branch_whitelist_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY public_key ALTER COLUMN id SET DEFAULT nextval('public_key_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY pull_request ALTER COLUMN id SET DEFAULT nextval('pull_request_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY release ALTER COLUMN id SET DEFAULT nextval('release_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY repository ALTER COLUMN id SET DEFAULT nextval('repository_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY star ALTER COLUMN id SET DEFAULT nextval('star_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY team ALTER COLUMN id SET DEFAULT nextval('team_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY team_repo ALTER COLUMN id SET DEFAULT nextval('team_repo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY team_user ALTER COLUMN id SET DEFAULT nextval('team_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY two_factor ALTER COLUMN id SET DEFAULT nextval('two_factor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY two_factor_recovery_code ALTER COLUMN id SET DEFAULT nextval('two_factor_recovery_code_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY upload ALTER COLUMN id SET DEFAULT nextval('upload_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY version ALTER COLUMN id SET DEFAULT nextval('version_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY watch ALTER COLUMN id SET DEFAULT nextval('watch_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY webhook ALTER COLUMN id SET DEFAULT nextval('webhook_id_seq'::regclass);


--
-- Data for Name: access; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY access (id, user_id, repo_id, mode) FROM stdin;
\.


--
-- Name: access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('access_id_seq', 1, false);


--
-- Data for Name: access_token; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY access_token (id, uid, name, sha1, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: access_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('access_token_id_seq', 1, false);


--
-- Data for Name: action; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY action (id, user_id, op_type, act_user_id, act_user_name, repo_id, repo_user_name, repo_name, ref_name, is_private, content, created_unix) FROM stdin;
\.


--
-- Name: action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('action_id_seq', 1, false);


--
-- Data for Name: attachment; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY attachment (id, uuid, issue_id, comment_id, release_id, name, created_unix) FROM stdin;
\.


--
-- Name: attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('attachment_id_seq', 1, false);


--
-- Data for Name: collaboration; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY collaboration (id, repo_id, user_id, mode) FROM stdin;
\.


--
-- Name: collaboration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('collaboration_id_seq', 1, false);


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY comment (id, type, poster_id, issue_id, commit_id, line, content, created_unix, updated_unix, commit_sha) FROM stdin;
\.


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('comment_id_seq', 1, false);


--
-- Data for Name: deploy_key; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY deploy_key (id, key_id, repo_id, name, fingerprint, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: deploy_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('deploy_key_id_seq', 1, false);


--
-- Data for Name: email_address; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY email_address (id, uid, email, is_activated) FROM stdin;
\.


--
-- Name: email_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('email_address_id_seq', 1, false);


--
-- Data for Name: follow; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY follow (id, user_id, follow_id) FROM stdin;
\.


--
-- Name: follow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('follow_id_seq', 1, false);


--
-- Data for Name: hook_task; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY hook_task (id, repo_id, hook_id, uuid, type, url, signature, payload_content, content_type, event_type, is_ssl, is_delivered, delivered, is_succeed, request_content, response_content) FROM stdin;
\.


--
-- Name: hook_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('hook_task_id_seq', 1, false);


--
-- Data for Name: issue; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY issue (id, repo_id, index, poster_id, name, content, milestone_id, priority, assignee_id, is_closed, is_pull, num_comments, deadline_unix, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: issue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('issue_id_seq', 1, false);


--
-- Data for Name: issue_label; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY issue_label (id, issue_id, label_id) FROM stdin;
\.


--
-- Name: issue_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('issue_label_id_seq', 1, false);


--
-- Data for Name: issue_user; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY issue_user (id, uid, issue_id, repo_id, milestone_id, is_read, is_assigned, is_mentioned, is_poster, is_closed) FROM stdin;
\.


--
-- Name: issue_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('issue_user_id_seq', 1, false);


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY label (id, repo_id, name, color, num_issues, num_closed_issues) FROM stdin;
\.


--
-- Name: label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('label_id_seq', 1, false);


--
-- Data for Name: login_source; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY login_source (id, type, name, is_actived, cfg, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: login_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('login_source_id_seq', 1, false);


--
-- Data for Name: milestone; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY milestone (id, repo_id, name, content, is_closed, num_issues, num_closed_issues, completeness, deadline_unix, closed_date_unix) FROM stdin;
\.


--
-- Name: milestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('milestone_id_seq', 1, false);


--
-- Data for Name: mirror; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY mirror (id, repo_id, "interval", enable_prune, updated_unix, next_update_unix) FROM stdin;
\.


--
-- Name: mirror_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('mirror_id_seq', 1, false);


--
-- Data for Name: notice; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY notice (id, type, description, created_unix) FROM stdin;
\.


--
-- Name: notice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('notice_id_seq', 1, false);


--
-- Data for Name: org_user; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY org_user (id, uid, org_id, is_public, is_owner, num_teams) FROM stdin;
\.


--
-- Name: org_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('org_user_id_seq', 1, false);


--
-- Data for Name: protect_branch; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY protect_branch (id, repo_id, name, protected, require_pull_request, enable_whitelist, whitelist_user_i_ds, whitelist_team_i_ds) FROM stdin;
\.


--
-- Name: protect_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('protect_branch_id_seq', 1, false);


--
-- Data for Name: protect_branch_whitelist; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY protect_branch_whitelist (id, protect_branch_id, repo_id, name, user_id) FROM stdin;
\.


--
-- Name: protect_branch_whitelist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('protect_branch_whitelist_id_seq', 1, false);


--
-- Data for Name: public_key; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY public_key (id, owner_id, name, fingerprint, content, mode, type, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: public_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('public_key_id_seq', 1, false);


--
-- Data for Name: pull_request; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY pull_request (id, type, status, issue_id, index, head_repo_id, base_repo_id, head_user_name, head_branch, base_branch, merge_base, has_merged, merged_commit_id, merger_id, merged_unix) FROM stdin;
\.


--
-- Name: pull_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('pull_request_id_seq', 1, false);


--
-- Data for Name: release; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY release (id, repo_id, publisher_id, tag_name, lower_tag_name, target, title, sha1, num_commits, note, is_draft, is_prerelease, created_unix) FROM stdin;
\.


--
-- Name: release_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('release_id_seq', 1, false);


--
-- Data for Name: repository; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY repository (id, owner_id, lower_name, name, description, website, default_branch, size, num_watches, num_stars, num_forks, num_issues, num_closed_issues, num_pulls, num_closed_pulls, num_milestones, num_closed_milestones, is_private, is_bare, is_mirror, enable_wiki, allow_public_wiki, enable_external_wiki, external_wiki_url, enable_issues, allow_public_issues, enable_external_tracker, external_tracker_url, external_tracker_format, external_tracker_style, enable_pulls, is_fork, fork_id, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: repository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('repository_id_seq', 1, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY star (id, uid, repo_id) FROM stdin;
\.


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('star_id_seq', 1, false);


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY team (id, org_id, lower_name, name, description, authorize, num_repos, num_members) FROM stdin;
\.


--
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('team_id_seq', 1, false);


--
-- Data for Name: team_repo; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY team_repo (id, org_id, team_id, repo_id) FROM stdin;
\.


--
-- Name: team_repo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('team_repo_id_seq', 1, false);


--
-- Data for Name: team_user; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY team_user (id, org_id, team_id, uid) FROM stdin;
\.


--
-- Name: team_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('team_user_id_seq', 1, false);


--
-- Data for Name: two_factor; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY two_factor (id, user_id, secret, created_unix) FROM stdin;
\.


--
-- Name: two_factor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('two_factor_id_seq', 1, false);


--
-- Data for Name: two_factor_recovery_code; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY two_factor_recovery_code (id, user_id, code, is_used) FROM stdin;
\.


--
-- Name: two_factor_recovery_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('two_factor_recovery_code_id_seq', 1, false);


--
-- Data for Name: upload; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY upload (id, uuid, name) FROM stdin;
\.


--
-- Name: upload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('upload_id_seq', 1, false);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY "user" (id, lower_name, name, full_name, email, passwd, login_type, login_source, login_name, type, location, website, rands, salt, created_unix, updated_unix, last_repo_visibility, max_repo_creation, is_active, is_admin, allow_git_hook, allow_import_local, prohibit_login, avatar, avatar_email, use_custom_avatar, num_followers, num_following, num_stars, num_repos, description, num_teams, num_members) FROM stdin;
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('user_id_seq', 1, false);


--
-- Data for Name: version; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY version (id, version) FROM stdin;
1	17
\.


--
-- Name: version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('version_id_seq', 1, true);


--
-- Data for Name: watch; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY watch (id, user_id, repo_id) FROM stdin;
\.


--
-- Name: watch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('watch_id_seq', 1, false);


--
-- Data for Name: webhook; Type: TABLE DATA; Schema: public; Owner: gogs
--

COPY webhook (id, repo_id, org_id, url, content_type, secret, events, is_ssl, is_active, hook_task_type, meta, last_status, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: webhook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gogs
--

SELECT pg_catalog.setval('webhook_id_seq', 1, false);


--
-- Name: access_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY access
    ADD CONSTRAINT access_pkey PRIMARY KEY (id);


--
-- Name: access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY access_token
    ADD CONSTRAINT access_token_pkey PRIMARY KEY (id);


--
-- Name: action_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY action
    ADD CONSTRAINT action_pkey PRIMARY KEY (id);


--
-- Name: attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY attachment
    ADD CONSTRAINT attachment_pkey PRIMARY KEY (id);


--
-- Name: collaboration_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY collaboration
    ADD CONSTRAINT collaboration_pkey PRIMARY KEY (id);


--
-- Name: comment_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: deploy_key_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY deploy_key
    ADD CONSTRAINT deploy_key_pkey PRIMARY KEY (id);


--
-- Name: email_address_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY email_address
    ADD CONSTRAINT email_address_pkey PRIMARY KEY (id);


--
-- Name: follow_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (id);


--
-- Name: hook_task_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY hook_task
    ADD CONSTRAINT hook_task_pkey PRIMARY KEY (id);


--
-- Name: issue_label_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY issue_label
    ADD CONSTRAINT issue_label_pkey PRIMARY KEY (id);


--
-- Name: issue_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY issue
    ADD CONSTRAINT issue_pkey PRIMARY KEY (id);


--
-- Name: issue_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY issue_user
    ADD CONSTRAINT issue_user_pkey PRIMARY KEY (id);


--
-- Name: label_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY label
    ADD CONSTRAINT label_pkey PRIMARY KEY (id);


--
-- Name: login_source_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY login_source
    ADD CONSTRAINT login_source_pkey PRIMARY KEY (id);


--
-- Name: milestone_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY milestone
    ADD CONSTRAINT milestone_pkey PRIMARY KEY (id);


--
-- Name: mirror_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY mirror
    ADD CONSTRAINT mirror_pkey PRIMARY KEY (id);


--
-- Name: notice_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY notice
    ADD CONSTRAINT notice_pkey PRIMARY KEY (id);


--
-- Name: org_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY org_user
    ADD CONSTRAINT org_user_pkey PRIMARY KEY (id);


--
-- Name: protect_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY protect_branch
    ADD CONSTRAINT protect_branch_pkey PRIMARY KEY (id);


--
-- Name: protect_branch_whitelist_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY protect_branch_whitelist
    ADD CONSTRAINT protect_branch_whitelist_pkey PRIMARY KEY (id);


--
-- Name: public_key_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY public_key
    ADD CONSTRAINT public_key_pkey PRIMARY KEY (id);


--
-- Name: pull_request_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY pull_request
    ADD CONSTRAINT pull_request_pkey PRIMARY KEY (id);


--
-- Name: release_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY release
    ADD CONSTRAINT release_pkey PRIMARY KEY (id);


--
-- Name: repository_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY repository
    ADD CONSTRAINT repository_pkey PRIMARY KEY (id);


--
-- Name: star_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY star
    ADD CONSTRAINT star_pkey PRIMARY KEY (id);


--
-- Name: team_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: team_repo_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY team_repo
    ADD CONSTRAINT team_repo_pkey PRIMARY KEY (id);


--
-- Name: team_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY team_user
    ADD CONSTRAINT team_user_pkey PRIMARY KEY (id);


--
-- Name: two_factor_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY two_factor
    ADD CONSTRAINT two_factor_pkey PRIMARY KEY (id);


--
-- Name: two_factor_recovery_code_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY two_factor_recovery_code
    ADD CONSTRAINT two_factor_recovery_code_pkey PRIMARY KEY (id);


--
-- Name: upload_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY upload
    ADD CONSTRAINT upload_pkey PRIMARY KEY (id);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: version_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY version
    ADD CONSTRAINT version_pkey PRIMARY KEY (id);


--
-- Name: watch_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY watch
    ADD CONSTRAINT watch_pkey PRIMARY KEY (id);


--
-- Name: webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: gogs
--

ALTER TABLE ONLY webhook
    ADD CONSTRAINT webhook_pkey PRIMARY KEY (id);


--
-- Name: IDX_access_token_uid; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_access_token_uid" ON access_token USING btree (uid);


--
-- Name: IDX_action_repo_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_action_repo_id" ON action USING btree (repo_id);


--
-- Name: IDX_attachment_issue_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_attachment_issue_id" ON attachment USING btree (issue_id);


--
-- Name: IDX_attachment_release_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_attachment_release_id" ON attachment USING btree (release_id);


--
-- Name: IDX_collaboration_repo_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_collaboration_repo_id" ON collaboration USING btree (repo_id);


--
-- Name: IDX_collaboration_user_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_collaboration_user_id" ON collaboration USING btree (user_id);


--
-- Name: IDX_comment_issue_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_comment_issue_id" ON comment USING btree (issue_id);


--
-- Name: IDX_deploy_key_key_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_deploy_key_key_id" ON deploy_key USING btree (key_id);


--
-- Name: IDX_deploy_key_repo_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_deploy_key_repo_id" ON deploy_key USING btree (repo_id);


--
-- Name: IDX_email_address_uid; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_email_address_uid" ON email_address USING btree (uid);


--
-- Name: IDX_hook_task_repo_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_hook_task_repo_id" ON hook_task USING btree (repo_id);


--
-- Name: IDX_issue_repo_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_issue_repo_id" ON issue USING btree (repo_id);


--
-- Name: IDX_issue_user_repo_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_issue_user_repo_id" ON issue_user USING btree (repo_id);


--
-- Name: IDX_issue_user_uid; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_issue_user_uid" ON issue_user USING btree (uid);


--
-- Name: IDX_label_repo_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_label_repo_id" ON label USING btree (repo_id);


--
-- Name: IDX_milestone_repo_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_milestone_repo_id" ON milestone USING btree (repo_id);


--
-- Name: IDX_org_user_org_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_org_user_org_id" ON org_user USING btree (org_id);


--
-- Name: IDX_org_user_uid; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_org_user_uid" ON org_user USING btree (uid);


--
-- Name: IDX_public_key_owner_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_public_key_owner_id" ON public_key USING btree (owner_id);


--
-- Name: IDX_pull_request_issue_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_pull_request_issue_id" ON pull_request USING btree (issue_id);


--
-- Name: IDX_repository_lower_name; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_repository_lower_name" ON repository USING btree (lower_name);


--
-- Name: IDX_repository_name; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_repository_name" ON repository USING btree (name);


--
-- Name: IDX_team_org_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_team_org_id" ON team USING btree (org_id);


--
-- Name: IDX_team_repo_org_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_team_repo_org_id" ON team_repo USING btree (org_id);


--
-- Name: IDX_team_user_org_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE INDEX "IDX_team_user_org_id" ON team_user USING btree (org_id);


--
-- Name: UQE_access_s; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_access_s" ON access USING btree (user_id, repo_id);


--
-- Name: UQE_access_token_sha1; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_access_token_sha1" ON access_token USING btree (sha1);


--
-- Name: UQE_attachment_uuid; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_attachment_uuid" ON attachment USING btree (uuid);


--
-- Name: UQE_collaboration_s; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_collaboration_s" ON collaboration USING btree (repo_id, user_id);


--
-- Name: UQE_deploy_key_s; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_deploy_key_s" ON deploy_key USING btree (key_id, repo_id);


--
-- Name: UQE_email_address_email; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_email_address_email" ON email_address USING btree (email);


--
-- Name: UQE_follow_follow; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_follow_follow" ON follow USING btree (user_id, follow_id);


--
-- Name: UQE_issue_label_s; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_issue_label_s" ON issue_label USING btree (issue_id, label_id);


--
-- Name: UQE_issue_repo_index; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_issue_repo_index" ON issue USING btree (repo_id, index);


--
-- Name: UQE_login_source_name; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_login_source_name" ON login_source USING btree (name);


--
-- Name: UQE_org_user_s; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_org_user_s" ON org_user USING btree (uid, org_id);


--
-- Name: UQE_protect_branch_protect_branch; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_protect_branch_protect_branch" ON protect_branch USING btree (repo_id, name);


--
-- Name: UQE_protect_branch_whitelist_protect_branch_whitelist; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_protect_branch_whitelist_protect_branch_whitelist" ON protect_branch_whitelist USING btree (repo_id, name, user_id);


--
-- Name: UQE_repository_s; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_repository_s" ON repository USING btree (owner_id, lower_name);


--
-- Name: UQE_star_s; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_star_s" ON star USING btree (uid, repo_id);


--
-- Name: UQE_team_repo_s; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_team_repo_s" ON team_repo USING btree (team_id, repo_id);


--
-- Name: UQE_team_user_s; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_team_user_s" ON team_user USING btree (team_id, uid);


--
-- Name: UQE_two_factor_user_id; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_two_factor_user_id" ON two_factor USING btree (user_id);


--
-- Name: UQE_upload_uuid; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_upload_uuid" ON upload USING btree (uuid);


--
-- Name: UQE_user_lower_name; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_user_lower_name" ON "user" USING btree (lower_name);


--
-- Name: UQE_user_name; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_user_name" ON "user" USING btree (name);


--
-- Name: UQE_watch_watch; Type: INDEX; Schema: public; Owner: gogs
--

CREATE UNIQUE INDEX "UQE_watch_watch" ON watch USING btree (user_id, repo_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

